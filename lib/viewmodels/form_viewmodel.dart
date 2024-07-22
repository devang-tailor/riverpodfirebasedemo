import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodfirebasedemo/models/user_model.dart';
import 'package:riverpodfirebasedemo/providers/providers.dart';

final formViewModelProvider = StateNotifierProvider<FormViewModel, List<UserModel>>((ref) {
  return FormViewModel(ref);
});

class FormViewModel extends StateNotifier<List<UserModel>> {
  final StateNotifierProviderRef<FormViewModel, List<UserModel>> ref;

  FormViewModel(this.ref) : super([]) {
    ref.read(firestoreServiceProvider).getUsers().listen((users) {
      state = users;
    });
  }

  Future<void> addUser(UserModel user) async {
    await ref.read(firestoreServiceProvider).addUser(user);
  }
}
