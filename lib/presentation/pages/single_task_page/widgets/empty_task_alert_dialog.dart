import 'package:flutter/material.dart';

class EmptyTaskAlertDialog extends StatelessWidget {
  const EmptyTaskAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Empty task'),
      content: const Text(
        'You must set due date and name or description of the task.\n'
        'Current task won\'t be saved.\n'
        'Are you sure you want to continue?',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Yes')),
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
