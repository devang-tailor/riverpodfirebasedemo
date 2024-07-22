import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodfirebasedemo/commons/constants.dart';
import 'package:riverpodfirebasedemo/models/user_model.dart';
import 'package:riverpodfirebasedemo/viewmodels/form_viewmodel.dart';


class UserFormView extends ConsumerStatefulWidget {
  @override
  _UserFormViewState createState() => _UserFormViewState();
}

class _UserFormViewState extends ConsumerState<UserFormView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  DateTime? _birthdate;
  String? _gender;
  List<String> _selectedLanguages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Please enter your age' : null,
              ),
              ListTile(
                title: Text('Birthdate: ${_birthdate != null ? _birthdate.toString().split(' ')[0] : ''}'),
                trailing: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) {
                      setState(() {
                        _birthdate = date;
                      });
                    }
                  },
                ),
              ),
              ListTile(
                title: Text('Gender'),
                trailing: DropdownButton<String>(
                  value: _gender,
                  items: ['Male', 'Female'].map((gender) {
                    return DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('Languages'),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: languages.map((language) {
                    return CheckboxListTile(
                      value: _selectedLanguages.contains(language),
                      title: Text(language),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            _selectedLanguages.add(language);
                          } else {
                            _selectedLanguages.remove(language);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _birthdate != null && _gender != null) {
                    final user = UserModel(
                      name: _nameController.text,
                      age: int.parse(_ageController.text),
                      birthdate: _birthdate!,
                      gender: _gender!,
                      languages: _selectedLanguages,
                    );
                    ref.read(formViewModelProvider.notifier).addUser(user);
                    Navigator.pop(context);
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
