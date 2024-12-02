import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/data/entities/task_model.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_cubit.dart';
import 'package:krainet_test/presentation/shared_widgets/delete_dialog.dart';

class DeleteIconButton extends StatelessWidget {
  final TaskModel task; // The task to be deleted when the button is pressed

  const DeleteIconButton({
    super.key,
    required this.task, // Initialize the task that will be deleted
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        // Show a confirmation dialog to the user asking if they are sure about deleting the task
        final answer = await showDialog<bool>(
          context: context,
          builder: (context) => const DeleteAlertDialog(),
        );
        // If the user confirms (answer is true), proceed to delete the task
        if (answer ?? false) {
          // Check if the context is still mounted (i.e., the widget is still in the widget tree)
          if (context.mounted) {
            // Pop the dialog and perform the deletion operation by calling the deleteTask method
            Navigator.of(context).pop();
            BlocProvider.of<TasksCubit>(context).deleteTask(task);
          }
        }
      },
      icon: const Icon(Icons.delete), // Display a delete icon
    );
  }
}
