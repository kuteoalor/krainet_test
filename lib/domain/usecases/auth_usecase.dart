import 'package:krainet_test/domain/data_interfaces/i_auth_repository.dart';

/// A use case class for handling authentication-related business logic.
///
/// This class relies on an implementation of the [AuthRepositoryInterface]
/// to perform authentication operations such as user sign-in, sign-up, and sign-out.
class AuthUsecase {
  /// The authentication repository used to interact with the data layer.
  final AuthRepositoryInterface _authRepository;

  /// Constructs an [AuthUsecase] with the provided [AuthRepositoryInterface].
  ///
  /// The repository should be an implementation of [AuthRepositoryInterface].
  AuthUsecase(this._authRepository);

  /// Signs in a user with the provided [email] and [password].

  Future<Map<String, String>> signIn(String email, String password) async {
    return await _authRepository.signIn(email, password);
  }

  /// Registers a new user with the provided [email] and [password].

  Future<Map<String, String>> signUp(String email, String password) async {
    return await _authRepository.signUp(email, password);
  }

  /// Signs out the currently authenticated user.

  Future<Map<String, String>> signOut() async {
    return await _authRepository.signOut();
  }
}
