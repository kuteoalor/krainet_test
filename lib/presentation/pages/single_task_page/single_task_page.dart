import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/data/entities/task_model.dart';
import 'package:krainet_test/presentation/pages/single_task_page/widgets/completed_button.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_cubit.dart';
import 'package:krainet_test/presentation/pages/single_task_page/widgets/delete_icon_button.dart';
import 'package:krainet_test/presentation/pages/single_task_page/widgets/due_time_button.dart';
import 'package:krainet_test/presentation/pages/single_task_page/widgets/empty_task_alert_dialog.dart';

/// A page for viewing, editing, or creating a single task.
///
/// Displays task details such as name, description, and due date. Provides
/// functionality for creating a new task, updating an existing task, marking
/// a task as completed, or deleting a task.
class SingleTaskPage extends StatefulWidget {
  /// The task to be displayed or edited.
  final TaskModel task;

  /// Indicates whether this page is used to create a new task.
  /// If true, the page is in "create mode."
  final bool creating;

  /// Constructor for SingleTaskPage.
  ///
  /// [task] is required and represents the task being displayed or edited.
  /// [creating] defaults to false, indicating that the task is being edited.
  const SingleTaskPage({
    super.key,
    required this.task,
    this.creating = false,
  });

  @override
  State<SingleTaskPage> createState() => _SingleTaskPageState();
}

class _SingleTaskPageState extends State<SingleTaskPage> {
  /// Controller for the task's name input field.
  late final TextEditingController taskNameController;

  /// Controller for the task's description input field.
  late final TextEditingController taskDescriptionController;

  /// Tracks whether the task's details have been modified.
  bool taskChanged = false;

  /// Stores a new due date if updated.
  DateTime? newDueDate;

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with the task's current details.
    taskDescriptionController =
        TextEditingController(text: widget.task.description);
    taskNameController = TextEditingController(text: widget.task.name);
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed.
    taskDescriptionController.dispose();
    taskNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.task.creationDate,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          // Handle navigation away from the page based on whether changes were made.
          if (didPop) return;
          if (widget.creating) {
            if (!taskChanged || newDueDate == null) {
              final answer = await showDialog<bool>(
                context: context,
                builder: (context) => const EmptyTaskAlertDialog(),
              );
              if (answer ?? false) {
                if (context.mounted) {
                  Navigator.pop(context);
                }
              }
            } else {
              final task = TaskModel(
                name: taskNameController.text,
                description: taskDescriptionController.text,
                creationDate: DateTime.now(),
                dueDate: newDueDate!,
              );
              BlocProvider.of<TasksCubit>(context).addTask(task);
              Navigator.pop(context);
            }
          } else {
            if (taskChanged || newDueDate != null) {
              BlocProvider.of<TasksCubit>(context).updateTask(
                task: widget.task,
                name: taskNameController.text,
                description: taskDescriptionController.text,
                dueDate: newDueDate,
              );
            }
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          backgroundColor: _getColor(),
          appBar: AppBar(
            backgroundColor: _getColor(),
            title: DueTimeButton(
              dueDate: widget.task.dueDate,
              onDatePicked: onNewDatePicked,
            ),
            actions: [
              DeleteIconButton(task: widget.task),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: _taskInfoFields(),
                ),
              ],
            ),
          ),
          persistentFooterAlignment: AlignmentDirectional.centerStart,
          persistentFooterButtons: [
            CompletedButton(task: widget.task),
          ],
        ),
      ),
    );
  }

  /// Builds the input fields for the task's name and description.
  Column _taskInfoFields() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: taskNameController,
          keyboardType: TextInputType.multiline,
          onChanged: (value) {
            if (!taskChanged) {
              setState(() {
                taskChanged = true;
              });
            }
          },
          maxLines: null,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: _getTextColor(),
          ),
          decoration: const InputDecoration(
            hintText: 'Name',
            border: InputBorder.none,
            hintStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          child: TextFormField(
            textAlign: TextAlign.start,
            controller: taskDescriptionController,
            maxLines: null,
            expands: true,
            onChanged: (value) {
              if (!taskChanged) {
                setState(() {
                  taskChanged = true;
                });
              }
            },
            style: TextStyle(
              fontSize: 16,
              color: _getTextColor(),
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Description',
              hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Returns the appropriate background color based on the task's state.
  Color _getColor() => widget.creating
      ? Theme.of(context).colorScheme.surfaceContainerLow
      : widget.task.isDone
          ? Theme.of(context).colorScheme.secondaryContainer
          : widget.task.isOverdued
              ? Theme.of(context).colorScheme.tertiaryContainer
              : Theme.of(context).colorScheme.surfaceContainerLow;

  /// Returns the appropriate text color based on the task's state.
  Color _getTextColor() => widget.creating
      ? Theme.of(context).colorScheme.onSurface
      : widget.task.isDone
          ? Theme.of(context).colorScheme.onSecondaryContainer
          : widget.task.isOverdued
              ? Theme.of(context).colorScheme.onTertiaryContainer
              : Theme.of(context).colorScheme.onSurface;

  /// Callback for updating the due date when a new date is selected.
  void onNewDatePicked(DateTime pickedDate) {
    setState(() => newDueDate = pickedDate);
  }
}
