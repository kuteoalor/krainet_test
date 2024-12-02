import 'package:krainet_test/data/data_sources/firestore_datasource.dart';
import 'package:krainet_test/data/entities/task_model.dart';
import 'package:krainet_test/domain/data_interfaces/i_firestore_repository.dart';

class FirestoreRepository implements FirestoreRepositoryInterface {
  final _firestoreDatasource = FirestoreDatasource();
  @override
  Future<List<TaskModel>> fetchTasks(String uid) async {
    return await _firestoreDatasource.fetchTasks(uid);
  }

  @override
  Future<void> updateTasks(String uid, List<TaskModel> tasks) async {
    await _firestoreDatasource.updateTasks(uid, tasks);
  }
}
