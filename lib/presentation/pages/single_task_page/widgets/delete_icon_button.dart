import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/data/entities/task_model.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_cubit.dart';
import 'package:krainet_test/presentation/shared_widgets/delete_dialog.dart';

class DeleteIconButton extends StatelessWidget {
  final TaskModel task;
  const DeleteIconButton({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final answer = await showDialog<bool>(
          context: context,
          builder: (context) => const DeleteAlertDialog(),
        );
        if (answer ?? false) {
          if (context.mounted) {
            Navigator.of(context).pop();
            BlocProvider.of<TasksCubit>(context).deleteTask(task);
          }
        }
      },
      icon: const Icon(Icons.delete),
    );
  }
}
