import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:krainet_test/data/entities/task_model.dart';
import 'package:krainet_test/presentation/pages/single_task_page/single_task_page.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_cubit.dart';
import 'package:krainet_test/presentation/shared_widgets/delete_dialog.dart';
import 'package:krainet_test/presentation/pages/tasks_page/widgets/done_chip.dart';

/// A widget that represents a single task card, displaying its details and actions.
///
/// The `TaskCard` supports navigation to a detailed task page, long-press deletion,
/// and various visual states for completed, overdue, or pending tasks.
class TaskCard extends StatelessWidget {
  /// The task to be displayed in this card.
  final TaskModel task;

  const TaskCard(
    this.task, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      /// Creates a shared element transition for the task card.
      tag: task.creationDate,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: _getColor(context),
        child: InkWell(
          /// Navigates to the single task detail page when tapped.
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 400),
                reverseTransitionDuration: const Duration(milliseconds: 400),
                pageBuilder: (_, __, ___) => SingleTaskPage(task: task),
              ),
            );
          },

          /// Prompts the user with a delete confirmation dialog when long-pressed.
          onLongPress: () async {
            final answer = await showDialog(
              context: context,
              builder: (context) => const DeleteAlertDialog(),
            );
            if (answer ?? false) {
              if (context.mounted) {
                BlocProvider.of<TasksCubit>(context).deleteTask(task);
              }
            }
          },
          child: Container(
            /// Styles the task card with a border and padding.
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// Displays the task name.
                      Text(
                        task.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: _getTextColor(context),
                        ),
                      ),
                      const Spacer(),

                      /// Displays the formatted creation date of the task.
                      Text(
                        formattedCreationDate,
                        style: TextStyle(
                          color: _getTextColor(context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  /// Displays the task description with ellipsis for overflow.
                  Text(
                    task.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.3,
                      color: _getTextColor(context),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      /// Displays a "Done" chip if the task is completed.
                      task.isDone ? const DoneChip() : const SizedBox(),
                      const Spacer(),

                      /// Displays the formatted due date of the task.
                      Text(
                        formattedDueDate,
                        style: TextStyle(
                          color: _getTextColor(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Returns a formatted string for the task's creation date.
  ///
  /// The format changes depending on whether the creation date is in the current year.
  String get formattedCreationDate {
    final formatString = task.creationDate.year == DateTime.now().year
        ? 'MMM dd'
        : 'MMM dd, yyyy';

    return DateFormat(formatString).format(task.creationDate);
  }

  /// Returns a formatted string for the task's due date, including time.
  ///
  /// The format changes depending on whether the due date is in the current year.
  String get formattedDueDate {
    final formatString = task.dueDate.year == DateTime.now().year
        ? 'MMM dd, '
        : 'MMM dd, yyyy, ';
    return 'due to: ${DateFormat(formatString).format(task.dueDate)}'
        '${DateFormat.Hm().format(task.dueDate)}';
  }

  /// Determines the background color of the task card based on its state.
  ///
  /// - Returns a secondary container color if the task is completed.
  /// - Returns a tertiary container color if the task is overdue.
  /// - Returns a surface container color for other tasks.
  Color _getColor(BuildContext context) => task.isDone
      ? Theme.of(context).colorScheme.secondaryContainer
      : task.isOverdued
          ? Theme.of(context).colorScheme.tertiaryContainer
          : Theme.of(context).colorScheme.surfaceContainerLow;

  /// Determines the text color of the task card based on its state.
  ///
  /// - Returns a secondary container text color if the task is completed.
  /// - Returns a tertiary container text color if the task is overdue.
  /// - Returns a surface text color for other tasks.
  Color _getTextColor(BuildContext context) => task.isDone
      ? Theme.of(context).colorScheme.onSecondaryContainer
      : task.isOverdued
          ? Theme.of(context).colorScheme.onTertiaryContainer
          : Theme.of(context).colorScheme.onSurface;
}
