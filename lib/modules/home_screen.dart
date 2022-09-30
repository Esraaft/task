import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:task/modules/add_user_screen.dart';
import 'package:task/modules/notes_edit_screen.dart';
import 'package:task/modules/options_screen.dart';
import 'package:task/utilities/http_service.dart';
import '../utilities/database_helper.dart';
import '../models/note/note_model.dart';
import '../models/user/user_model.dart';

DatabaseHelper helper = DatabaseHelper();
final HttpService _service = HttpService();

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //database
    //helper.getNoteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
        ),
        actions: [
          new IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () {
              setState(() {});
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddUser()),
              );
            },
          ),
          new IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Options()),
              );
            },
          ),
          Icon(Icons.clear_all),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: _service.getNotes(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          snapshot.data[index].text,
                          maxLines: 2,
                        ),
                        trailing: const Icon(Icons.edit),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NotesEdit(noteId: snapshot.data[index].id)),
                          );
                        },
                      ),
                      Divider(), //                           <-- Divider
                    ],
                  );
                },
              );
            }
            return Container(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
