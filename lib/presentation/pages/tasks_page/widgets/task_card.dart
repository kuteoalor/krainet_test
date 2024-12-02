import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:krainet_test/data/entities/task_model.dart';
import 'package:krainet_test/presentation/pages/single_task_page/single_task_page.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_cubit.dart';
import 'package:krainet_test/presentation/shared_widgets/delete_dialog.dart';
import 'package:krainet_test/presentation/pages/tasks_page/widgets/done_chip.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  const TaskCard(
    this.task, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: task.creationDate,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: _getColor(context),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 400),
                reverseTransitionDuration: const Duration(milliseconds: 400),
                pageBuilder: (_, __, ___) => SingleTaskPage(task: task),
              ),
            );
          },
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
                      Text(
                        task.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: _getTextColor(context),
                        ),
                      ),
                      const Spacer(),
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
                      task.isDone ? const DoneChip() : const SizedBox(),
                      const Spacer(),
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

  String get formattedCreationDate {
    final formatString = task.creationDate.year == DateTime.now().year
        ? 'MMM dd'
        : 'MMM dd, yyyy';

    return DateFormat(formatString).format(task.creationDate);
  }

  String get formattedDueDate {
    final formatString = task.dueDate.year == DateTime.now().year
        ? 'MMM dd, '
        : 'MMM dd, yyyy, ';
    return 'due to: ${DateFormat(formatString).format(task.dueDate)}'
        '${DateFormat.Hm().format(task.dueDate)}';
  }

  Color _getColor(BuildContext context) => task.isDone
      ? Theme.of(context).colorScheme.secondaryContainer
      : task.isOverdued
          ? Theme.of(context).colorScheme.tertiaryContainer
          : Theme.of(context).colorScheme.surfaceContainerLow;

  Color _getTextColor(BuildContext context) => task.isDone
      ? Theme.of(context).colorScheme.onSecondaryContainer
      : task.isOverdued
          ? Theme.of(context).colorScheme.onTertiaryContainer
          : Theme.of(context).colorScheme.onSurface;
}
