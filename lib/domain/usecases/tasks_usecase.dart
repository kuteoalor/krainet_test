import 'package:krainet_test/data/entities/task_model.dart';
import 'package:krainet_test/data/repositories/firestore_repository.dart';

/// A use case class for handling task-related business logic.
///
/// This class interacts with a [FirestoreRepository] to manage tasks,
/// including fetching and updating tasks associated with a specific user.
class TasksUsecase {
  /// The Firestore repository used to interact with the data layer.
  final FirestoreRepository _firestoreRepository;

  /// Constructs a [TasksUsecase] with the provided [FirestoreRepository].
  ///
  /// The repository is responsible for executing Firestore operations.
  TasksUsecase(this._firestoreRepository);

  /// Fetches the list of tasks for the user identified by [uid].
  ///
  /// - Delegates the operation to [_firestoreRepository.fetchTasks].
  /// - Returns a `Future<List<TaskModel>>` containing the user's tasks.
  Future<List<TaskModel>> fetchTasks(String uid) {
    return _firestoreRepository.fetchTasks(uid);
  }

  /// Updates the list of tasks for the user identified by [uid].
  ///
  /// - Accepts a list of [TaskModel] objects ([tasks]) to be stored in Firestore.
  /// - Delegates the operation to [_firestoreRepository.updateTasks].
  void updateTasks(String uid, List<TaskModel> tasks) {
    _firestoreRepository.updateTasks(uid, tasks);
  }
}
