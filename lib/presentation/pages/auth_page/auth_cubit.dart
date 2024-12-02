import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/domain/usecases/auth_usecase.dart';
import 'package:krainet_test/presentation/pages/auth_page/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUsecase _authUsecase;
  AuthCubit(this._authUsecase) : super(AuthStateInitial(message: 'initial'));

  void signIn(String email, String password) async {
    final response = await _authUsecase.signIn(email, password);
    switch (response['status']) {
      case 'success':
        emit(
          AuthStateAuthorized(message: response['uid']!),
        );
      case 'error':
        emit(
          AuthStateError(message: response['message']!),
        );
    }
  }

  void signUp(String email, String password) async {
    final response = await _authUsecase.signUp(email, password);
    switch (response['status']) {
      case 'success':
        emit(
          AuthStateAuthorized(message: response['uid']!),
        );
      case 'error':
        emit(
          AuthStateError(message: response['message']!),
        );
    }
  }

  void signOut() async {
    final response = await _authUsecase.signOut();
    switch (response['status']) {
      case 'success':
        emit(
          AuthStateInitial(message: 'Logged out'),
        );
      case 'error':
        emit(
          AuthStateError(message: response['message']!),
        );
    }
  }
}
