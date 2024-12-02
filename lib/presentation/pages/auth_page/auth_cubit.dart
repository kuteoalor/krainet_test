import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krainet_test/domain/usecases/auth_usecase.dart';
import 'package:krainet_test/presentation/pages/auth_page/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUsecase _authUsecase;

  AuthCubit(this._authUsecase) : super(AuthStateInitial(message: 'initial'));

  // Sign in method
  void signIn(String email, String password) async {
    final response = await _authUsecase.signIn(email, password);

    // Handle the response status
    if (response['status'] == 'success') {
      emit(AuthStateAuthorized(message: response['uid'] ?? 'Unknown UID'));
    } else {
      emit(AuthStateError(
          message: response['message'] ?? 'Unknown error occurred'));
    }
  }

  // Sign up method
  void signUp(String email, String password) async {
    final response = await _authUsecase.signUp(email, password);

    if (response['status'] == 'success') {
      emit(AuthStateAuthorized(message: response['uid'] ?? 'Unknown UID'));
    } else {
      emit(AuthStateError(
          message: response['message'] ?? 'Unknown error occurred'));
    }
  }

  // Sign out method
  void signOut() async {
    final response = await _authUsecase.signOut();

    if (response['status'] == 'success') {
      emit(AuthStateInitial(message: 'Logged out'));
    } else {
      emit(AuthStateError(
          message: response['message'] ?? 'Unknown error occurred'));
    }
  }
}
