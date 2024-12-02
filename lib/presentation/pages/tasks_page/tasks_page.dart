import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/data/entities/task_model.dart';
import 'package:krainet_test/presentation/pages/single_task_page/single_task_page.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_cubit.dart';
import 'package:krainet_test/presentation/pages/tasks_page/widgets/filter_bar.dart';
import 'package:krainet_test/presentation/pages/tasks_page/widgets/options_drawer.dart';
import 'package:krainet_test/presentation/pages/tasks_page/widgets/sort_button.dart';
import 'package:krainet_test/presentation/pages/tasks_page/widgets/tasks_list.dart';

/// The main page for managing and displaying tasks.
///
/// The [TasksPage] provides a user interface to display the list of tasks,
/// filter and sort them, and create new tasks. It interacts with the
/// [TasksCubit] for state management and utilizes widgets for various task operations.
class TasksPage extends StatefulWidget {
  /// Default constructor for [TasksPage].
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  /// Initializes the state by fetching tasks from the repository
  /// via the [TasksCubit].
  @override
  void initState() {
    BlocProvider.of<TasksCubit>(context).getTasks();
    super.initState();
  }

  /// Builds the main structure of the tasks page.
  ///
  /// Includes:
  /// - An AppBar with a sort button.
  /// - A drawer for additional options.
  /// - A floating action button to add new tasks.
  /// - A body with a filter bar and a task list.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          SortButton(), // Button to sort tasks.
        ],
      ),
      drawer: const OptionsDrawer(), // Drawer with additional settings.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to a new page for creating a task.
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SingleTaskPage(
                task: TaskModel.empty(), // Pass an empty task for creation.
                creating: true, // Indicates the task is being created.
              ),
            ),
          );
        },
        child: const Icon(Icons.add), // Icon for adding a new task.
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            FilterBar(), // Widget for filtering tasks.
            TasksList(), // Widget for displaying the list of tasks.
          ],
        ),
      ),
    );
  }
}
