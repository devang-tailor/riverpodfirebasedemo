import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodfirebasedemo/viewmodels/form_viewmodel.dart';
import 'package:riverpodfirebasedemo/views/user_form_view.dart';
class HomeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(formViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text('Age: ${user.age}, Birthdate: ${user.birthdate}, Gender: ${user.gender}, Languages: ${user.languages.join(', ')}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserFormView()),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
