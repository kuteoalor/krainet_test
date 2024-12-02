import 'package:krainet_test/data/data_sources/firestore_datasource.dart';
import 'package:krainet_test/data/entities/task_model.dart';
import 'package:krainet_test/domain/data_interfaces/i_firestore_repository.dart';

/// A repository that implements the [FirestoreRepositoryInterface] for managing task data in Firestore.
///
/// This class acts as a bridge between the Firestore data source ([FirestoreDatasource]) and the domain layer,
/// providing methods to fetch and update tasks associated with a specific user.
class FirestoreRepository implements FirestoreRepositoryInterface {
  /// Instance of the Firestore data source to handle lower-level Firestore operations.
  final _firestoreDatasource = FirestoreDatasource();

  /// Fetches the list of tasks for the user identified by [uid].
  ///
  /// - Delegates the operation to [_firestoreDatasource.fetchTasks].
  /// - Returns a `List<TaskModel>` containing the user's tasks.
  /// - If the user's document does not exist, an empty list is returned, and the document is initialized.
  @override
  Future<List<TaskModel>> fetchTasks(String uid) async {
    return await _firestoreDatasource.fetchTasks(uid);
  }

  /// Updates the list of tasks for the user identified by [uid].
  ///
  /// - Converts the provided list of [TaskModel] objects into a JSON-serializable format
  ///   and updates the Firestore document.
  /// - Delegates the operation to [_firestoreDatasource.updateTasks].

  @override
  Future<void> updateTasks(String uid, List<TaskModel> tasks) async {
    await _firestoreDatasource.updateTasks(uid, tasks);
  }
}
