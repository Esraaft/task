import 'package:flutter/material.dart';
import 'package:task/models/interst/intrest.dart';

import '../models/user/user_model.dart';
import '../utilities/http_service.dart';

class AddUser extends StatefulWidget {
  _AddUser createState() => _AddUser();
}

class _AddUser extends State<AddUser> {
  User user = User();
  Intrest intr = intrests[0];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add User',
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                //backgroundImage: AssetImage('assets/images/img.png'),
                radius: 50,
              ),
              Text("Select Image"),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'UserName',
                ),
                onSaved: (String? value) {
                  user.username = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                onSaved: (String? value) {
                  user.email = value;
                },
                validator: (String? value) {
                  return (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!))
                      ? 'password should have alphabet and numbers minmum 8 char.'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                onSaved: (String? value) {
                  user.password = value;
                },
                validator: (String? value) {
                  return (RegExp('^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}')
                          .hasMatch(value!))
                      ? 'numbers and alphabet.'
                      : null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.validate();
                  },
                  child: Text("Save")),
              DropdownButton<Intrest>(
                //isDense: true,
                value: intr,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                ),
                onChanged: (Intrest? newValue) {
                  setState(() {
                    user.intrestId = newValue!;
                  });
                },
                items: intrests.map<DropdownMenuItem<Intrest>>((Intrest value) {
                  return DropdownMenuItem<Intrest>(
                    value: value,
                    child: Text(value.intrestText),
                  );
                }).toList(),
              ),
            ]),
      ),
    );
  }
}
