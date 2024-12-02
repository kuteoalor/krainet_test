import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// A class that handles authentication-related operations such as sign-up, sign-in, and sign-out.
/// This class uses Firebase Authentication.
class AuthDatasource {
  /// Firebase Authentication service instance.
  final authService = FirebaseAuth.instance;

  /// Registers a new user with the provided [email] and [password].
  ///
  /// - Returns a `Map` containing:
  ///   - `status`: "success" or "error".
  ///   - `uid` (on success): The user's unique ID.
  ///   - `message` (on error): An error description.
  ///
  /// - Validates email format and hashes the password using SHA-256 before sending it to Firebase.
  Future<Map<String, String>> signUp(String email, String password) async {
    if (!EmailValidator.validate(email)) {
      return {
        'status': 'error',
        'message': 'The email address is badly formatted',
      };
    }
    try {
      final passwordBytes = utf8.encode(password);
      final digestPassword = sha256.convert(passwordBytes);
      final credentials = await authService.createUserWithEmailAndPassword(
        email: email,
        password: digestPassword.toString(),
      );
      final uid = credentials.user!.uid;
      return {
        'status': 'success',
        'uid': uid,
      };
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return {
          'status': 'error',
          'message': 'The password provided is too weak',
        };
      } else if (e.code == 'email-is-already-in-use') {
        return {
          'status': 'error',
          'message': 'The account already exists for that email',
        };
      }
    } catch (_) {
      return {'status': 'error', 'message': 'SignUp error'};
    }
    return {};
  }

  /// Logs in an existing user with the provided [email] and [password].
  ///
  /// - Returns a `Map` containing:
  ///   - `status`: "success" or "error".
  ///   - `uid` (on success): The user's unique ID.
  ///   - `message` (on error): An error description.
  ///
  /// - Validates email format and hashes the password using SHA-256 before sending it to Firebase.
  Future<Map<String, String>> signIn(String email, String password) async {
    if (!EmailValidator.validate(email)) {
      return {
        'status': 'error',
        'message': 'The email address is badly formatted',
      };
    }
    try {
      final passwordBytes = utf8.encode(password);
      final digestPassword = sha256.convert(passwordBytes);
      final credentials = await authService.signInWithEmailAndPassword(
        email: email,
        password: digestPassword.toString(),
      );
      final uid = credentials.user!.uid;
      return {
        'status': 'success',
        'uid': uid,
      };
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return {
          'status': 'error',
          'message': 'No user found for that email.',
        };
      } else if (e.code == 'wrong-password') {
        return {
          'status': 'error',
          'message': 'Wrong password provided for that user.',
        };
      }
    } catch (_) {
      return {'status': 'error', 'message': 'Sign in error'};
    }
    return {};
  }

  /// Logs out the currently authenticated user.
  ///
  /// - Returns a `Map` containing:
  ///   - `status`: "success" or "error".
  ///   - `message` (on error): An error description.
  Future<Map<String, String>> signOut() async {
    try {
      await authService.signOut();
      return {
        'status': 'success',
      };
    } on Exception catch (_) {
      return {
        'status': 'error',
        'message': 'Sign Out error',
      };
    }
  }

  /// Retrieves the unique identifier (UID) of the currently authenticated user.
  ///
  /// - Throws an exception if no user is authenticated.
  String get uid => authService.currentUser!.uid;
}
