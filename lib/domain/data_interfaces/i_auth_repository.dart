abstract class AuthRepositoryInterface {
  Future<Map<String, String>> signIn(String email, String password);
  Future<Map<String, String>> signUp(String email, String password);
  Future<Map<String, String>> signOut();
  String getUid();
}
