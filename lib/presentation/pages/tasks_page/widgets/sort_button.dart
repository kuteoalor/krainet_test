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
  // Initial sort option
  SortOption selected = SortOption.creationDateDesc;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      menuPadding: const EdgeInsets.all(0), // Remove padding inside the menu
      elevation: 10, // Shadow of the menu
      position: PopupMenuPosition.under, // Display the menu below the icon
      icon: const Icon(Icons.sort), // Icon to trigger the sort options
      onSelected: (value) {
        setState(() {
          selected = value; // Update the selected sort option
          // Notify the cubit to apply the new sort option
          BlocProvider.of<TasksCubit>(context).sortOptionChanged(selected);
        });
      },
      itemBuilder: (context) => [
        // Sorting by creation date (new to old)
        PopupMenuItem(
          value: SortOption.creationDateDesc,
          child: Row(
            children: [
              selected == SortOption.creationDateDesc
                  ? const Icon(Icons.check) // Show check if selected
                  : const SizedBox(),
              const Text('By creation date (new to old)'),
            ],
          ),
        ),
        // Sorting by creation date (old to new)
        PopupMenuItem(
          value: SortOption.creationDateAsc,
          child: Row(
            children: [
              selected == SortOption.creationDateAsc
                  ? const Icon(Icons.check) // Show check if selected
                  : const SizedBox(),
              const Text('By creation date (old to new)'),
            ],
          ),
        ),
        // Sorting by due date (new to old)
        PopupMenuItem(
          value: SortOption.dueDateDesc,
          child: Row(
            children: [
              selected == SortOption.dueDateDesc
                  ? const Icon(Icons.check) // Show check if selected
                  : const SizedBox(),
              const Text('By due date (new to old)'),
            ],
          ),
        ),
        // Sorting by due date (old to new)
        PopupMenuItem(
          value: SortOption.dueDateAsc,
          child: Row(
            children: [
              selected == SortOption.dueDateAsc
                  ? const Icon(Icons.check) // Show check if selected
                  : const SizedBox(),
              const Text('By due date (old to new)'),
            ],
          ),
        ),
      ],
    );
  }
}
