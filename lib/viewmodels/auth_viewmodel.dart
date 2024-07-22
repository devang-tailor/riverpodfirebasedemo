import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpodfirebasedemo/providers/providers.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, User?>((ref) {
  return AuthViewModel(ref);
});

class AuthViewModel extends StateNotifier<User?> {
  final StateNotifierProviderRef<AuthViewModel, User?> ref;

  AuthViewModel(this.ref) : super(null) {
    ref.read(firebaseAuthServiceProvider).authStateChanges.listen((user) {
      state = user;
    });
  }

  Future<void> signInWithGoogle() async {
    state = await ref.read(firebaseAuthServiceProvider).signInWithGoogle();
  }

  Future<void> signOut() async {
    await ref.read(firebaseAuthServiceProvider).signOut();
  }
}
