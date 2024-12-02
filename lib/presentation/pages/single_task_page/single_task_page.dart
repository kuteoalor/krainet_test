import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/data/entities/task_model.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_cubit.dart';
import 'package:krainet_test/presentation/pages/single_task_page/widgets/delete_icon_button.dart';
import 'package:krainet_test/presentation/pages/single_task_page/widgets/due_time_button.dart';
import 'package:krainet_test/presentation/pages/single_task_page/widgets/empty_task_alert_dialog.dart';

class SingleTaskPage extends StatefulWidget {
  final TaskModel task;
  final bool creating;
  const SingleTaskPage({
    super.key,
    required this.task,
    this.creating = false,
  });

  @override
  State<SingleTaskPage> createState() => _SingleTaskPageState();
}

class _SingleTaskPageState extends State<SingleTaskPage> {
  late final TextEditingController taskNameController;
  late final TextEditingController taskDescriptionController;
  bool taskChanged = false;
  //bool dueDateChanged = false;
  DateTime? newDueDate;

  @override
  void initState() {
    super.initState();
    taskDescriptionController =
        TextEditingController(text: widget.task.description);
    taskNameController = TextEditingController(text: widget.task.name);
  }

  @override
  void dispose() {
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
          if (didPop) {
            return;
          }
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
              DeleteIconButton(
                task: widget.task,
              ),
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
            CompletedButton(
              task: widget.task,
            ),
          ],
        ),
      ),
    );
  }

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
            minLines: null,
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

  Color _getColor() => widget.creating
      ? Theme.of(context).colorScheme.surfaceContainerLow
      : widget.task.isDone
          ? Theme.of(context).colorScheme.secondaryContainer
          : widget.task.isOverdued
              ? Theme.of(context).colorScheme.tertiaryContainer
              : Theme.of(context).colorScheme.surfaceContainerLow;

  Color _getTextColor() => widget.creating
      ? Theme.of(context).colorScheme.onSurface
      : widget.task.isDone
          ? Theme.of(context).colorScheme.onSecondaryContainer
          : widget.task.isOverdued
              ? Theme.of(context).colorScheme.onTertiaryContainer
              : Theme.of(context).colorScheme.onSurface;

  void onNewDatePicked(DateTime pickedDate) {
    setState(() => newDueDate = pickedDate);
  }
}

class CompletedButton extends StatefulWidget {
  final TaskModel task;
  const CompletedButton({
    super.key,
    required this.task,
  });

  @override
  State<CompletedButton> createState() => _CompletedButtonState();
}

class _CompletedButtonState extends State<CompletedButton> {
  late bool isDone;

  @override
  void initState() {
    super.initState();
    isDone = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          isDone = !isDone;
        });
        BlocProvider.of<TasksCubit>(context).updateTask(
          task: widget.task,
          isDone: isDone,
        );
      },
      child: isDone
          ? const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Done!',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    maxRadius: 13,
                    child: Icon(Icons.check),
                  ),
                ],
              ),
            )
          : const Text(
              'Mark as done',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
    );
  }
}
