import 'package:krainet_test/data/entities/task_model.dart';
import 'package:krainet_test/presentation/utils/enums.dart';

class TasksState {
  final List<TaskModel> tasks;
  final List<TaskModel> displayedTasks;
  final FilterOption filterOption;
  final SortOption sortOption;
  final TasksLoadingState tasksLoadingState;

  const TasksState({
    required this.tasks,
    required this.displayedTasks,
    this.tasksLoadingState = TasksLoadingState.initial,
    this.filterOption = FilterOption.all,
    this.sortOption = SortOption.creationDateDesc,
  });

  factory TasksState.fromPrev({
    List<TaskModel>? tasks,
    List<TaskModel>? displayedTasks,
    FilterOption? filterOption,
    SortOption? sortOption,
    TasksLoadingState? tasksLoadingState,
    required TasksState prevState,
  }) {
    return TasksState(
      tasks: tasks ?? prevState.tasks,
      displayedTasks: displayedTasks ?? prevState.displayedTasks,
      filterOption: filterOption ?? prevState.filterOption,
      sortOption: sortOption ?? prevState.sortOption,
      tasksLoadingState: tasksLoadingState ?? prevState.tasksLoadingState,
    );
  }
}
