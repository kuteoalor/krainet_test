import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDatasource {
  final authService = FirebaseAuth.instance;
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
      return {'status': 'error', 'message': 'Sign iN error'};
    }
    return {};
  }

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

  String get uid => authService.currentUser!.uid;
}
