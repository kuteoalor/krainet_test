import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/data/entities/task_model.dart';
import 'package:krainet_test/domain/usecases/tasks_usecase.dart';
import 'package:krainet_test/domain/usecases/uid_usecase.dart';
import 'package:krainet_test/presentation/pages/tasks_page/tasks_state.dart';
import 'package:krainet_test/presentation/utils/enums.dart';

/// A Cubit for managing tasks in the application.
///
/// The [TasksCubit] handles fetching, filtering, sorting, adding, updating,
/// and deleting tasks. It maintains the current state of tasks and user-selected
/// options such as filters and sorting.
class TasksCubit extends Cubit<TasksState> {
  final TasksUsecase _tasksUsecase; // Use case for handling task operations.
  final UidUsecase _uidUsecase; // Use case for handling user ID operations.

  /// Constructor to initialize the [TasksCubit] with required use cases.
  TasksCubit(this._tasksUsecase, this._uidUsecase)
      : super(const TasksState(tasks: [], displayedTasks: []));

  /// Fetches tasks from the repository and updates the state.
  void getTasks() async {
    emit(
      TasksState.fromPrev(
        prevState: state,
        tasksLoadingState: TasksLoadingState.loading,
      ),
    );
    try {
      final tasks = await _tasksUsecase.fetchTasks(_uidUsecase.getUid());
      emit(
        TasksState(
          tasks: tasks,
          displayedTasks: tasks.reversed.toList(),
          tasksLoadingState: TasksLoadingState.fetched,
        ),
      );
    } catch (e) {
      emit(
        TasksState.fromPrev(
          prevState: state,
          tasksLoadingState: TasksLoadingState.erorr,
        ),
      );
    }
  }

  /// Updates the state based on the selected [filterOption].
  void filterOptionChanged(FilterOption filterOption) {
    var displayedTasks = switch (filterOption) {
      FilterOption.all => state.tasks,
      FilterOption.completed =>
        state.tasks.where((task) => task.isDone).toList(),
      FilterOption.active => state.tasks.where((task) => !task.isDone).toList(),
    };
    emit(
      TasksState.fromPrev(
        prevState: state,
        filterOption: filterOption,
        displayedTasks: displayedTasks,
      ),
    );
  }

  /// Updates the state based on the selected [sortOption].
  void sortOptionChanged(SortOption sortOption) {
    final displayedTasks = List<TaskModel>.from(state.displayedTasks);
    switch (sortOption) {
      case SortOption.creationDateAsc:
        displayedTasks.sort(
          (task1, task2) => task1.creationDate.compareTo(task2.creationDate),
        );
      case SortOption.creationDateDesc:
        displayedTasks.sort(
          (task1, task2) => task2.creationDate.compareTo(task1.creationDate),
        );
      case SortOption.dueDateAsc:
        displayedTasks.sort(
          (task1, task2) => task1.dueDate.compareTo(task2.dueDate),
        );
      case SortOption.dueDateDesc:
        displayedTasks.sort(
          (task1, task2) => task2.dueDate.compareTo(task1.dueDate),
        );
    }
    emit(
      TasksState.fromPrev(
        prevState: state,
        sortOption: sortOption,
        displayedTasks: displayedTasks,
      ),
    );
  }

  /// Adds a new task to the list and updates the state.
  ///
  /// The tasks are updated on the server and re-sorted/filtered
  /// based on the current options.
  void addTask(TaskModel task) {
    final tasks = List<TaskModel>.from(state.tasks);
    tasks.add(task);
    emit(
      TasksState.fromPrev(
        prevState: state,
        tasks: tasks,
      ),
    );
    _tasksUsecase.updateTasks(_uidUsecase.getUid(), tasks);
    sortOptionChanged(state.sortOption);
    filterOptionChanged(state.filterOption);
  }

  /// Deletes a task from the list and updates the state.
  ///
  /// The tasks are updated on the server and re-filtered
  /// based on the current filter option.
  void deleteTask(TaskModel task) {
    final tasks = List<TaskModel>.from(state.tasks);
    tasks.remove(task);
    emit(
      TasksState.fromPrev(
        prevState: state,
        tasks: tasks,
      ),
    );
    _tasksUsecase.updateTasks(_uidUsecase.getUid(), tasks);
    filterOptionChanged(state.filterOption);
  }

  /// Updates a task with new values and updates the state.
  ///
  /// If a task's properties are modified, the changes are sent to the server,
  /// and the tasks are re-filtered based on the current filter option.
  void updateTask({
    required TaskModel task,
    String? name,
    String? description,
    DateTime? dueDate,
    bool? isDone,
  }) {
    final newTask = TaskModel(
      name: name ?? task.name,
      description: description ?? task.description,
      creationDate: task.creationDate,
      dueDate: dueDate ?? task.dueDate,
      isDone: isDone ?? task.isDone,
    );
    final tasks = List<TaskModel>.from(state.tasks);
    final index = tasks.indexOf(task);
    tasks.replaceRange(index, index + 1, [newTask]);
    emit(TasksState.fromPrev(prevState: state, tasks: tasks));
    _tasksUsecase.updateTasks(_uidUsecase.getUid(), tasks);
    filterOptionChanged(state.filterOption);
  }
}
