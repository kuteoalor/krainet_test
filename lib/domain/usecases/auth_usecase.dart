import 'package:krainet_test/domain/data_interfaces/i_auth_repository.dart';

class AuthUsecase {
  final AuthRepositoryInterface _authRepository;

  AuthUsecase(this._authRepository);

  Future<Map<String, String>> signIn(String email, String password) async {
    return await _authRepository.signIn(email, password);
  }

  Future<Map<String, String>> signUp(String email, String password) async {
    return await _authRepository.signUp(email, password);
  }

  Future<Map<String, String>> signOut() async {
    return await _authRepository.signOut();
  }
}
