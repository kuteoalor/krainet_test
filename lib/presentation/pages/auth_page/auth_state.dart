class AuthState {
  final String message;

  AuthState({required this.message});
}

class AuthStateInitial extends AuthState {
  AuthStateInitial({required super.message});
}

class AuthStateError extends AuthState {
  AuthStateError({required super.message});
}

class AuthStateAuthorized extends AuthState {
  AuthStateAuthorized({required super.message});
}
