import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/interst/intrest.dart';
import '../models/note/note_model.dart';
import '../models/user/user_model.dart';

List<Note> notes = [];
List<Intrest> intrests = [];
List<User> users = [];

class HttpService {
  String baseUrl = "https://noteapi.popssolutions.net";

  Future<List<Note>> getNotes() async {
    notes.clear();
    String url = "$baseUrl/notes/getall";

    final response = await http.get(Uri.parse(url));

    print("here");
    try {
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);

        for (var singleNote in responseData) {
          Note note = Note(
              text: singleNote["text"],
              placeDateTime: singleNote["placeDateTime"],
              userId: singleNote["userId"],
              id: singleNote["id"]);

          //Adding user to the list.
          notes.add(note);
          print(notes.length);
        }
        await getIntreset();
        await getUsers();
      } else {
        print("can't see post");
      }
    } catch (e) {
      print(e);
    }
    return notes;
  }

  Future<List<User>> getUsers() async {
    users.clear();
    String url = "$baseUrl/users/getall";
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);

        for (var singleUser in responseData) {
          User user = User(
              username: singleUser["username"],
              password: singleUser["password"],
              email: singleUser["email"],
              imageAsBase64: singleUser["imageAsBase64"],
              intrestId: singleUser["intrestId"],
              id: singleUser["id"]);

          users.add(user);
          print("can't see User");
        }
      }
    } catch (e) {
      print(e);
    }

    return users;
  }

  Future<List<Intrest>> getIntreset() async {
    intrests.clear();
    String url = "$baseUrl/intrests/getall";
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        print("here 1");
        var responseData = json.decode(response.body);

        for (var singleIntrest in responseData) {
          Intrest intrest = Intrest(
            id: singleIntrest["id"],
            intrestText: singleIntrest["intrestText"],
          );

          intrests.add(intrest);
          print("can't see intrest");
        }
      }
    } catch (e) {
      print(e);
    }

    return intrests;
  }
  // Future<http.Response> updateNote(String title) {
  //   return http.put(
  //     Uri.parse(baseUrl + '/notes/update'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'title': title,
  //     }),
  //   );
  // }

  // Future<http.Response> createUser(String bad) {
  //   return http.post(
  //     Uri.parse(baseUrl + 'Insert User'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, List<String>>{
  //       'id': id,
  //       'email': email,
  //       'imageAsBase64': imageAsBase64,
  //       'intrestId': intrestId,
  //       'password': password,
  //       'username': username,
  //     }),
  //   );
  // }
}
