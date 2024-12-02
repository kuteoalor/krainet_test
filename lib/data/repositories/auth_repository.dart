import 'package:krainet_test/data/data_sources/auth_datasource.dart';
import 'package:krainet_test/domain/data_interfaces/i_auth_repository.dart';

/// A repository that implements the [AuthRepositoryInterface] for handling authentication operations.
///
/// This class serves as an intermediary between the data source ([AuthDatasource]) and the domain layer,
/// providing methods for user sign-in, sign-up, and sign-out, as well as retrieving the current user's UID.
class AuthRepository implements AuthRepositoryInterface {
  /// Instance of the authentication data source to handle lower-level operations.
  final _authDataSourse = AuthDatasource();

  /// Signs in a user with the provided [email] and [password].
  ///
  /// - Delegates the operation to [_authDataSourse.signIn].
  /// - Returns a `Map<String, String>` containing:
  ///   - `status`: "success" or "error".
  ///   - `uid` (on success): The user's unique ID.
  ///   - `message` (on error): An error description.
  @override
  Future<Map<String, String>> signIn(String email, String password) async {
    return await _authDataSourse.signIn(email, password);
  }

  /// Signs out the currently authenticated user.
  ///
  /// - Delegates the operation to [_authDataSourse.signOut].
  /// - Returns a `Map<String, String>` containing:
  ///   - `status`: "success" or "error".
  ///   - `message` (on error): An error description.
  @override
  Future<Map<String, String>> signOut() async {
    return await _authDataSourse.signOut();
  }

  /// Registers a new user with the provided [email] and [password].
  ///
  /// - Delegates the operation to [_authDataSourse.signUp].
  /// - Returns a `Map<String, String>` containing:
  ///   - `status`: "success" or "error".
  ///   - `uid` (on success): The user's unique ID.
  ///   - `message` (on error): An error description.
  @override
  Future<Map<String, String>> signUp(String email, String password) async {
    return await _authDataSourse.signUp(email, password);
  }

  /// Retrieves the unique identifier (UID) of the currently authenticated user.
  ///
  /// - Delegates the operation to [_authDataSourse.uid].
  /// - Returns a [String] representing the user's UID.
  @override
  String getUid() => _authDataSourse.uid;
}
