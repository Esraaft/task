import 'package:flutter/material.dart';

class Note {
  var text, placeDateTime, userId, id;

  Note(
      {required this.id,
      required this.placeDateTime,
      required this.text,
      required this.userId});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = Map<String, dynamic>();
    if (id != null) {
      data['id'] = id;
    }
    data['text'] = text;
    data['placeDateTime'] = placeDateTime;
    data['userId'] = userId;
    return data;
  }

  @override
  toString() {
    return {
      'id': id,
      'text': text,
      'placeDateTime': placeDateTime,
      'userId': userId,
    }.toString();
  }

  Note.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.text = map['text'];
    this.placeDateTime = map['placeDateTime'];
    this.userId = map['userId'];
  }
}
