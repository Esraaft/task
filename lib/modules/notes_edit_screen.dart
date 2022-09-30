import 'package:flutter/material.dart';
import 'package:task/modules/home_screen.dart';

import '../models/user/user_model.dart';
import '../utilities/http_service.dart';

class NotesEdit extends StatefulWidget {
  String noteId;
  NotesEdit({Key? key, required this.noteId}) : super(key: key);
  _NotesEdit createState() => _NotesEdit();
}

class _NotesEdit extends State<NotesEdit> {
  User user = users[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Note',
        ),
        actions: [
          new IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ' Note',
                ),
              ),
            ),
            DropdownButton<User>(
              //isDense: true,
              value: user,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              underline: Container(
                height: 2,
              ),
              onChanged: (User? newValue) {
                setState(() {});
              },
              items: users.map<DropdownMenuItem<User>>((User value) {
                return DropdownMenuItem<User>(
                  value: value,
                  child: Text(value.username),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
