import 'package:krainet_test/data/entities/task_model.dart';
import 'package:krainet_test/presentation/utils/enums.dart';

/// Represents the state of the tasks page.
///
/// The [TasksState] holds the data for the list of tasks, the currently displayed tasks,
/// the filter and sort options, and the loading state for tasks.
class TasksState {
  /// The list of all tasks.
  final List<TaskModel> tasks;

  /// The list of tasks that are displayed, filtered and sorted.
  final List<TaskModel> displayedTasks;

  /// The current filter option for displaying tasks.
  final FilterOption filterOption;

  /// The current sort option for ordering tasks.
  final SortOption sortOption;

  /// The loading state of the tasks.
  final TasksLoadingState tasksLoadingState;

  /// Constructs a new [TasksState] with the provided values.
  ///
  /// The default values are:
  /// - [tasksLoadingState] is set to [TasksLoadingState.initial].
  /// - [filterOption] is set to [FilterOption.all].
  /// - [sortOption] is set to [SortOption.creationDateDesc].
  const TasksState({
    required this.tasks,
    required this.displayedTasks,
    this.tasksLoadingState = TasksLoadingState.initial,
    this.filterOption = FilterOption.all,
    this.sortOption = SortOption.creationDateDesc,
  });

  /// Creates a new [TasksState] based on a previous state, optionally overriding some of its fields.
  ///
  /// If a field is not provided, the previous state's value will be used.
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
