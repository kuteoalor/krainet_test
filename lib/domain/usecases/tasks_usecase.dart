import 'package:krainet_test/data/entities/task_model.dart';
import 'package:krainet_test/data/repositories/firestore_repository.dart';

class TasksUsecase {
  final FirestoreRepository _firestoreRepository;

  TasksUsecase(this._firestoreRepository);

  Future<List<TaskModel>> fetchTasks(String uid) {
    return _firestoreRepository.fetchTasks(uid);
  }

  void updateTasks(String uid, List<TaskModel> tasks) {
    _firestoreRepository.updateTasks(uid, tasks);
  }
}
