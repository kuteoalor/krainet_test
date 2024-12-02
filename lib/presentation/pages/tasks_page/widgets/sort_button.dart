import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_cubit.dart';
import 'package:krainet_test/presentation/utils/enums.dart';

class SortButton extends StatefulWidget {
  const SortButton({
    super.key,
  });

  @override
  State<SortButton> createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  SortOption selected = SortOption.creationDateDesc;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      menuPadding: const EdgeInsets.all(0),
      elevation: 10,
      position: PopupMenuPosition.under,
      icon: const Icon(Icons.sort),
      onSelected: (value) {
        setState(() {
          selected = value;
          BlocProvider.of<TasksCubit>(context).sortOptionChanged(selected);
        });
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: SortOption.creationDateDesc,
          child: Row(
            children: [
              selected == SortOption.creationDateDesc
                  ? const Icon(Icons.check)
                  : const SizedBox(),
              const Text('By creation date (new to old)'),
            ],
          ),
        ),
        PopupMenuItem(
          value: SortOption.creationDateAsc,
          child: Row(
            children: [
              selected == SortOption.creationDateAsc
                  ? const Icon(Icons.check)
                  : const SizedBox(),
              const Text('By creation date (old to new)'),
            ],
          ),
        ),
        PopupMenuItem(
          value: SortOption.dueDateDesc,
          child: Row(
            children: [
              selected == SortOption.dueDateDesc
                  ? const Icon(Icons.check)
                  : const SizedBox(),
              const Text('By due date (new to old)'),
            ],
          ),
        ),
        PopupMenuItem(
          value: SortOption.dueDateAsc,
          child: Row(
            children: [
              selected == SortOption.dueDateAsc
                  ? const Icon(Icons.check)
                  : const SizedBox(),
              const Text('By due date (old to new)'),
            ],
          ),
        ),
      ],
    );
  }
}
