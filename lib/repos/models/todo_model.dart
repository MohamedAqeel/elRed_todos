// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  final String name;
  final String id;
  final String desc;
  final String userId;
  final DateTime updated_ts;
  final DateTime completion_ts;
  bool completed;

  TodoModel(
      {required this.userId,
      required this.name,
      required this.desc,
      required this.id,
      required this.updated_ts,
      required this.completion_ts,
      this.completed = false});

  TodoModel.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        desc = json['desc'],
        name = json['name'],
        completed = json['completed'] ?? false,
        updated_ts = DateTime.parse(
            (json['updated_ts'] as Timestamp).toDate().toString()),
        completion_ts = DateTime.parse(
            (json['completion_ts'] as Timestamp).toDate().toString());

  Map<String, dynamic> toJson() => {
        'name': name,
        'desc': desc,
        'id': id,
        'userId': userId,
        'updated_ts': updated_ts,
        'completed': completed,
        'completion_ts': completion_ts,
      };
}
