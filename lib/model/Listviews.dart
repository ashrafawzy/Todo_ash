import 'package:flutter/cupertino.dart';

import '../core/utils/image_constant.dart';


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
 final bool? isCompleted;
  TaskModel( {
    final List<Task>? taskList,

    required this.id,
    required this.name,
    required this.desc,
    required this.date,
    required this.time,
    required this.imagePath,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'date': date,
      'time': time,
      'imagePath': imagePath,
      '':isCompleted
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      date: map['date'],
      time: map['time'],
      imagePath: map['imagePath'], isCompleted:  map['isCompleted'],
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
  bool? isCompleted;
  Task({ required this.id,required this.name,required this.desc,required this.date,required this.time
  ,required this.imagePath,required this.isCompleted});

  @override
  List<Object?> get props => [id, name, desc, date, time, imagePath,isCompleted];

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      date: map['date'],
      time: map['time'],
      imagePath: map['imagePath'],
isCompleted: map['isCompleted']
    );
  }

}