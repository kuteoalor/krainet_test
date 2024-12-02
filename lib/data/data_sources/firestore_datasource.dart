import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:krainet_test/data/entities/task_model.dart';

/// A class that handles Firestore operations related to task management.
/// This class manages tasks for users, including fetching and updating tasks.
class FirestoreDatasource {
  /// Instance of Firestore for database operations.
  final _firestore = FirebaseFirestore.instance;

  /// Name of the Firestore collection that stores user data.
  static const _usersCollectionName = 'users';

  /// Fetches the list of tasks for a user identified by [uid].
  ///
  /// - If the user's document exists in the Firestore, retrieves the tasks field and converts
  ///   each task into a [TaskModel] object.
  /// - If the user's document does not exist, creates an empty document with an empty tasks list.
  ///
  /// - Returns a `List<TaskModel>` containing the user's tasks.
  Future<List<TaskModel>> fetchTasks(String uid) async {
    final userData =
        await _firestore.collection(_usersCollectionName).doc(uid).get();
    if (userData.exists) {
      final tasks = userData.data()!['tasks'] as List<dynamic>;
      return tasks.map((task) => TaskModel.fromJson(task)).toList();
    } else {
      _firestore.collection(_usersCollectionName).doc(uid).set({
        'tasks': [],
      });
      return [];
    }
  }

  /// Updates the tasks list for a user identified by [uid].
  ///
  /// - Converts the list of [TaskModel] objects into a JSON-serializable format and
  ///   updates the tasks field in the Firestore document.
  ///

  Future<void> updateTasks(String uid, List<TaskModel> tasks) async {
    final jsonTasks = tasks.map((task) => task.toJson()).toList();

    await _firestore.collection(_usersCollectionName).doc(uid).update({
      'tasks': jsonTasks,
    });
  }
}
