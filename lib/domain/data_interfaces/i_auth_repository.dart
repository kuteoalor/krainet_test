/// An abstract interface for authentication-related operations.
///
/// Defines the contract for implementing classes to handle user sign-in,
/// sign-up, sign-out, and retrieval of the authenticated user's UID.
abstract class AuthRepositoryInterface {
  /// Signs in a user with the provided [email] and [password].

  Future<Map<String, String>> signIn(String email, String password);

  /// Registers a new user with the provided [email] and [password].

  Future<Map<String, String>> signUp(String email, String password);

  /// Signs out the currently authenticated user.

  Future<Map<String, String>> signOut();

  /// Retrieves the unique identifier (UID) of the currently authenticated user.

  String getUid();
}
