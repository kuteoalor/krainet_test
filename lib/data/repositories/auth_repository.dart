import 'package:krainet_test/data/data_sources/auth_datasource.dart';
import 'package:krainet_test/domain/data_interfaces/i_auth_repository.dart';

class AuthRepository implements AuthRepositoryInterface {
  final _authDataSourse = AuthDatasource();
  @override
  Future<Map<String, String>> signIn(String email, String password) async {
    return await _authDataSourse.signIn(email, password);
  }

  @override
  Future<Map<String, String>> signOut() async {
    return await _authDataSourse.signOut();
  }

  @override
  Future<Map<String, String>> signUp(String email, String password) async {
    return await _authDataSourse.signUp(email, password);
  }

  @override
  String getUid() => _authDataSourse.uid;
}
