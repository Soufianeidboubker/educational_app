import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthNotifier, User?>((ref) => AuthNotifier());

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier() : super(null);

  Future<void> login(String email, String password) async {
    try {
      state = (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      )).user;
    } catch (e) {
      throw Exception("Login failed");
    }
  }
}