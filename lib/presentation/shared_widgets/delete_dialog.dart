import 'package:flutter/material.dart';

/// A dialog that asks the user to confirm whether they want to delete a task.
class DeleteAlertDialog extends StatelessWidget {
  const DeleteAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete task'), // The title of the dialog.
      content: const Text(
        'Are you sure you want to delete this task?', // The message asking for confirmation.
      ),
      actions: [
        // Button to confirm the deletion.
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Yes'),
        ),
        // Button to cancel the deletion.
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
