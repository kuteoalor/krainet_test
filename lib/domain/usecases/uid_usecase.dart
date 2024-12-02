import 'package:krainet_test/domain/data_interfaces/i_auth_repository.dart';

/// A use case class for retrieving the UID of the currently authenticated user.
///
/// This class interacts with the [AuthRepositoryInterface] to fetch the user's unique identifier (UID).
class UidUsecase {
  /// The authentication repository used to interact with the data layer for user information.
  final AuthRepositoryInterface _authRepository;

  /// Constructs a [UidUsecase] with the provided [AuthRepositoryInterface].
  ///
  /// The repository should be an implementation of [AuthRepositoryInterface],
  /// which handles authentication-related operations such as user sign-in and retrieval of UID.
  UidUsecase(this._authRepository);

  /// Retrieves the UID of the currently authenticated user.
  ///
  /// - Calls the [getUid] method on [_authRepository] to obtain the user's unique identifier.
  /// - Returns the UID as a [String].
  String getUid() => _authRepository.getUid();
}
