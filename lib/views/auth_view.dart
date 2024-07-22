import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodfirebasedemo/viewmodels/auth_viewmodel.dart';

class AuthView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Firebase Auth')),
      body: Center(
        child: user == null
            ? ElevatedButton(
          onPressed: () => ref.read(authViewModelProvider.notifier).signInWithGoogle(),
          child: Text('Sign in with Google'),
        )
            : ElevatedButton(
          onPressed: () => ref.read(authViewModelProvider.notifier).signOut(),
          child: Text('Sign Out'),
        ),
      ),
    );
  }
}
