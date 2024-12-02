import 'package:krainet_test/data/entities/task_model.dart';

/// An abstract interface for Firestore operations related to task management.
///
/// Defines the contract for implementing classes to fetch and update tasks
/// associated with a specific user in Firestore.
abstract class FirestoreRepositoryInterface {
  /// Fetches the list of tasks for the user identified by [uid].

  Future<List<TaskModel>> fetchTasks(String uid);

  /// Updates the list of tasks for the user identified by [uid].

  Future<void> updateTasks(String uid, List<TaskModel> tasks);
}
