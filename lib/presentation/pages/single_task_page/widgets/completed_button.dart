import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/data/entities/task_model.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_cubit.dart';

class CompletedButton extends StatefulWidget {
  final TaskModel
      task; // The task object that will be marked as completed or not
  const CompletedButton({
    super.key,
    required this.task,
  });

  @override
  State<CompletedButton> createState() => _CompletedButtonState();
}

class _CompletedButtonState extends State<CompletedButton> {
  late bool isDone; // This variable will hold the task's completion state

  @override
  void initState() {
    super.initState();
    isDone = widget.task
        .isDone; // Initialize the button state based on the task's completion status
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          isDone = !isDone; // Toggle the completion state
        });
        BlocProvider.of<TasksCubit>(context).updateTask(
          task: widget.task, // Pass the task to the cubit to update
          isDone: isDone, // Pass the updated completion status
        );
      },
      child: isDone
          // If the task is marked as done, show the "Done!" text with a check icon
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
                    child: Icon(Icons
                        .check), // Check icon indicating the task is completed
                  ),
                ],
              ),
            )
          // If the task is not marked as done, show the "Mark as done" text
          : const Text(
              'Mark as done',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
    );
  }
}
