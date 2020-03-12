import 'package:flutter/foundation.dart';

class TodoModel {

  final String id;
  final String name;
  final Priority priority;
  final Status status;
  final String dateCreated;
  final String userId;

  TodoModel({this.id, @required this.name, @required this.priority, @required this.status, @required this.dateCreated, @required this.userId});


}

enum Priority {
  High,
  Medium,
  Low
}

enum Status {
  Done,
  Pending
}