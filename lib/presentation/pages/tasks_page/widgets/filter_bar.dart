import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_cubit.dart';
import 'package:krainet_test/presentation/utils/enums.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({
    super.key,
  });

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  // Default filter option is 'all'
  FilterOption selected = FilterOption.all;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Ensures the bar takes full width
      child: SegmentedButton<FilterOption>(
        // A segmented button widget for the filter options
        showSelectedIcon: false, // Disables the selected icon display
        segments: const [
          // Define the filter options and their icons
          ButtonSegment<FilterOption>(
            value: FilterOption.all,
            label: Text('All'),
            icon: Icon(Icons.list),
          ),
          ButtonSegment<FilterOption>(
            value: FilterOption.active,
            label: Text('Active'),
            icon: Icon(Icons.rocket_launch_outlined),
          ),
          ButtonSegment<FilterOption>(
            value: FilterOption.completed,
            label: Text('Done'),
            icon: Icon(Icons.check),
          ),
        ],
        selected: {selected}, // The currently selected filter option
        onSelectionChanged: (p0) {
          // Updates the selected filter and triggers filtering
          setState(() {
            selected = p0.first; // Update the selected filter
          });
          // Notify the cubit to update the task filter
          BlocProvider.of<TasksCubit>(context).filterOptionChanged(selected);
        },
      ),
    );
  }
}
