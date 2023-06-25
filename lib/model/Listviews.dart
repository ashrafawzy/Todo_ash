import 'package:flutter/cupertino.dart';

import '../core/utils/image_constant.dart';
import 'database.dart';

List<String> _images = [
  ImageConstant.shoping,
  ImageConstant.basket,
ImageConstant.parking,
  ImageConstant.berthday,
  ImageConstant.gym,
  ImageConstant.dote,
];
class TaskModel {
  final int id;
  final String name;
  final String desc;
  final String date;
  final String time;
  final String imagePath;

  TaskModel({
    final List<Task>? taskList,

    required this.id,
    required this.name,
    required this.desc,
    required this.date,
    required this.time,
    required this.imagePath,

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'date': date,
      'time': time,
      'imagePath': imagePath,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      date: map['date'],
      time: map['time'],
      imagePath: map['imagePath'],
    );

  }

}
// class TaskModel {
//   final List<Task> taskList;
//
//   TaskModel({required this.taskList, required id, required name, required desc, required date, required time, required imagePath});
//
//   int taskCount() => taskList.length;
// }
class Task {
  String id;
  String name;
  String desc;
  String date;
  String time;
  String imagePath;
  Task({ required this.id,required this.name,required this.desc,required this.date,required this.time,required this.imagePath});

  @override
  List<Object?> get props => [id, name, desc, date, time, imagePath];

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      date: map['date'],
      time: map['time'],
      imagePath: map['imagePath'],
    );
  }

}