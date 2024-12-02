import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_cubit.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_state.dart';
import 'package:krainet_test/presentation/pages/tasks_page/widgets/task_card.dart';
import 'package:krainet_test/presentation/utils/enums.dart';

/// A widget that displays a list of tasks, with UI variations for loading, error, and empty states.
///
/// The `TasksList` widget listens to state changes from the [TasksCubit] and rebuilds the UI accordingly.
/// It includes features like pull-to-refresh and retry actions.
class TasksList extends StatelessWidget {
  /// Creates an instance of [TasksList].
  const TasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TasksCubit, TasksState>(
        /// Builds the UI based on the current state of [TasksState].
        builder: (context, state) {
          switch (state.tasksLoadingState) {
            // Display a loading indicator when tasks are being fetched.
            case TasksLoadingState.initial:
            case TasksLoadingState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );

            // Display an error message with a retry button when fetching fails.
            case TasksLoadingState.erorr:
              return Column(
                children: [
                  const Text('Unable to fetch tasks'),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    /// Attempts to refetch the tasks when pressed.
                    onPressed: () =>
                        BlocProvider.of<TasksCubit>(context).getTasks(),
                    child: const Text('Try again'),
                  ),
                ],
              );

            // Display the list of tasks or a placeholder if no tasks exist.
            case TasksLoadingState.fetched:
              return state.tasks.isNotEmpty
                  ? RefreshIndicator(
                      /// Allows the user to refresh the task list by pulling down.
                      onRefresh: () async =>
                          BlocProvider.of<TasksCubit>(context).getTasks(),
                      child: ListView.separated(
                        /// The number of tasks to display.
                        itemCount: state.displayedTasks.length,

                        /// Builds individual task cards.
                        itemBuilder: (_, index) {
                          return TaskCard(state.displayedTasks[index]);
                        },

                        /// Adds spacing between task cards.
                        separatorBuilder: (_, __) => const SizedBox(
                          height: 10,
                        ),
                      ),
                    )
                  : const Center(
                      /// Placeholder text when there are no tasks.
                      child: Text(
                        'Your tasks will be displayed here',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
          }
        },
      ),
    );
  }
}
