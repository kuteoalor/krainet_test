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
  FilterOption selected = FilterOption.all;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SegmentedButton<FilterOption>(
        showSelectedIcon: false,
        segments: const [
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
        selected: {selected},
        onSelectionChanged: (p0) {
          setState(() {
            selected = p0.first;
          });
          BlocProvider.of<TasksCubit>(context).filterOptionChanged(selected);
        },
      ),
    );
  }
}
