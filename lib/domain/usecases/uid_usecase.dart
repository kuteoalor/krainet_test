import 'package:krainet_test/domain/data_interfaces/i_auth_repository.dart';

class UidUsecase {
  final AuthRepositoryInterface _authRepository;

  UidUsecase(this._authRepository);
  String getUid() => _authRepository.getUid();
}
