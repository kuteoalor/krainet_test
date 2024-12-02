/// A model representing a task with its details such as name, description,
/// creation date, due date, and completion status.
class TaskModel {
  /// The name of the task.
  final String name;

  /// A detailed description of the task.
  final String description;

  /// The date and time when the task was created.
  final DateTime creationDate;

  /// The date and time by which the task should be completed.
  final DateTime dueDate;

  /// Indicates whether the task has been completed.
  final bool isDone;

  /// Creates a new [TaskModel] instance with the given details.
  ///
  /// By default, [isDone] is set to `false`.
  const TaskModel({
    required this.name,
    required this.description,
    required this.creationDate,
    required this.dueDate,
    this.isDone = false,
  });

  /// Creates an empty [TaskModel] with default values.
  ///
  /// Useful for initializing a task model without specific data.
  factory TaskModel.empty() {
    return TaskModel(
      name: '',
      description: '',
      creationDate: DateTime(0),
      dueDate: DateTime(0),
    );
  }

  /// Constructs a [TaskModel] from a JSON object.
  ///
  /// Converts date fields (`creationDate` and `dueDate`) from milliseconds since epoch
  /// to [DateTime] objects.
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      name: json['name'],
      description: json['description'],
      creationDate: DateTime.fromMillisecondsSinceEpoch(json['creationDate']),
      dueDate: DateTime.fromMillisecondsSinceEpoch(json['dueDate']),
      isDone: json['isDone'],
    );
  }

  /// Converts this [TaskModel] instance into a JSON-compatible format.
  ///
  /// Date fields (`creationDate` and `dueDate`) are converted to milliseconds since epoch.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'dueDate': dueDate.millisecondsSinceEpoch,
      'creationDate': creationDate.millisecondsSinceEpoch,
      'isDone': isDone,
    };
  }

  /// Checks if the task is overdue and not completed.
  ///
  /// Returns `true` if the current date is past the due date and the task is not done.
  bool get isOverdued => dueDate.compareTo(DateTime.now()) < 0 && !isDone;

  /// Returns a string representation of the task, showing its name and due date.
  @override
  String toString() {
    return '$name $dueDate';
  }
}
