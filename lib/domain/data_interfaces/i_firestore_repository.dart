import 'package:krainet_test/data/entities/task_model.dart';

abstract class FirestoreRepositoryInterface {
  Future<List<TaskModel>> fetchTasks(String uid);
  Future<void> updateTasks(String uid, List<TaskModel> tasks);
}
