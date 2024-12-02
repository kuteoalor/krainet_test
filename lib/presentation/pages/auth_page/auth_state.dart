// Base class for all authentication states.
// It holds the message that can be displayed in the UI.
class AuthState {
  final String message;

  // Constructor to initialize the message.
  AuthState({required this.message});
}

// State representing the initial state of the authentication process.
// It extends the base AuthState and passes the message to the superclass constructor.
class AuthStateInitial extends AuthState {
  AuthStateInitial({required super.message});
}

// State representing an error during the authentication process.
// It extends the base AuthState and passes the error message to the superclass constructor.
class AuthStateError extends AuthState {
  AuthStateError({required super.message});
}

// State representing a successful authorization (i.e., user logged in).
// It extends the base AuthState and passes the success message to the superclass constructor.
class AuthStateAuthorized extends AuthState {
  AuthStateAuthorized({required super.message});
}
