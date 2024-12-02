class TaskModel {
  final String name;
  final String description;
  final DateTime creationDate;
  final DateTime dueDate;
  final bool isDone;

  const TaskModel({
    required this.name,
    required this.description,
    required this.creationDate,
    required this.dueDate,
    this.isDone = false,
  });

  factory TaskModel.empty() {
    return TaskModel(
      name: '',
      description: '',
      creationDate: DateTime(0),
      dueDate: DateTime(0),
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      name: json['name'],
      description: json['description'],
      creationDate: DateTime.fromMillisecondsSinceEpoch(json['creationDate']),
      dueDate: DateTime.fromMillisecondsSinceEpoch(json['dueDate']),
      isDone: json['isDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'dueDate': dueDate.millisecondsSinceEpoch,
      'creationDate': creationDate.millisecondsSinceEpoch,
      'isDone': isDone,
    };
  }

  bool get isOverdued => dueDate.compareTo(DateTime.now()) < 0 && !isDone;

  @override
  String toString() {
    return '$name $dueDate';
  }
}

final tasks = [
  TaskModel(
    name: 'Choose a present for mama',
    description: '''
    I need to a present for my mom ASAP!
    Maybe skibidi ohio rizz party fanum tax
    quandale dingle sigma donald trump woke biden
    zelensky daddy zelensky evangelion zelensky
    ''',
    creationDate: DateTime.now(),
    dueDate: DateTime(2024, 12, 03, 18, 00),
  ),
  TaskModel(
    name: 'Finish this task',
    description: '''
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
  Etiam sollicitudin sem nec vulputate fermentum. Suspendisse 
  potenti. Aliquam luctus sed odio vitae commodo. Pellentesque
  habitant morbi tristique senectus et netus et malesuada fames
  ac turpis egestas. Nunc sit amet iaculis mi. In consequat sapien
  et nibh bibendum, quis faucibus leo laoreet. Proin in sollicitudin 
    ''',
    creationDate: DateTime(2024, 11, 28, 13, 54),
    dueDate: DateTime(2024, 12, 02, 12, 00),
  ),
  TaskModel(
    name: 'Finish this task',
    description: '''
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
  Etiam sollicitudin sem nec vulputate fermentum. Suspendisse 
  potenti. Aliquam luctus sed odio vitae commodo. Pellentesque
  habitant morbi tristique senectus et netus et malesuada fames
  ac turpis egestas. Nunc sit amet iaculis mi. In consequat sapien
  et nibh bibendum, quis faucibus leo laoreet. Proin in sollicitudin 
    ''',
    creationDate: DateTime(2024, 11, 28, 13, 55),
    dueDate: DateTime(2024, 11, 02, 12, 00),
  ),
  TaskModel(
    name: 'Finish this task',
    description: '''
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
  Etiam sollicitudin sem nec vulputate fermentum. Suspendisse 
  potenti. Aliquam luctus sed odio vitae commodo. Pellentesque
  habitant morbi tristique senectus et netus et malesuada fames
  ac turpis egestas. Nunc sit amet iaculis mi. In consequat sapien
  et nibh bibendum, quis faucibus leo laoreet. Proin in sollicitudin 
    ''',
    creationDate: DateTime(2024, 11, 28, 13, 56),
    dueDate: DateTime(2024, 12, 02, 12, 00),
    isDone: true,
  ),
];
