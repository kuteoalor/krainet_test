import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_cubit.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_state.dart';
import 'package:krainet_test/presentation/pages/tasks_page/widgets/task_card.dart';
import 'package:krainet_test/presentation/utils/enums.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TasksCubit, TasksState>(
        builder: (context, state) {
          switch (state.tasksLoadingState) {
            case TasksLoadingState.initial:
            case TasksLoadingState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case TasksLoadingState.erorr:
              return Column(
                children: [
                  const Text('Unable to fetch tasks'),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () =>
                        BlocProvider.of<TasksCubit>(context).getTasks(),
                    child: const Text('Try again'),
                  ),
                ],
              );
            case TasksLoadingState.fetched:
              return state.tasks.isNotEmpty
                  ? RefreshIndicator(
                      onRefresh: () async =>
                          BlocProvider.of<TasksCubit>(context).getTasks(),
                      child: ListView.separated(
                        itemCount: state.displayedTasks.length,
                        itemBuilder: (_, index) {
                          return TaskCard(state.displayedTasks[index]);
                        },
                        separatorBuilder: (_, __) => const SizedBox(
                          height: 10,
                        ),
                      ),
                    )
                  : const Center(
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
