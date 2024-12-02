import 'package:flutter/material.dart';

class DeleteAlertDialog extends StatelessWidget {
  const DeleteAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete task'),
      content: const Text(
        'Are you sure you want to delete this task?',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Yes'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
