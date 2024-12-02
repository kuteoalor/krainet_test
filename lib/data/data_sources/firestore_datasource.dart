import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:krainet_test/data/entities/task_model.dart';

class FirestoreDatasource {
  final _firestore = FirebaseFirestore.instance;
  static const _usersCollectionName = 'users';

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

  Future<void> updateTasks(String uid, List<TaskModel> tasks) async {
    final jsonTasks = tasks.map((task) => task.toJson()).toList();

    await _firestore.collection(_usersCollectionName).doc(uid).update({
      'tasks': jsonTasks,
    });
  }
}
