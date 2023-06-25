// import 'package:flutter/foundation.dart';
// import 'package:meta/meta.dart';
//
// class TaskModel {
//   final String id;
//   final String name;
//   final String desc;
//   final String date;
//   final String time;
//   final String imagePath;
//   final bool isSelected;
//
//   const TaskModel({
//     required this.id,
//     required this.name,
//     required this.desc,
//     required this.date,
//     required this.time,
//     required this.imagePath,
//     this.isSelected = false,
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'description': desc,
//       'date': date,
//       'time': time,
//       'imagePath': imagePath,
//     };
//   }
//
//   factory TaskModel.fromMap(Map<String, dynamic> map) {
//     return TaskModel(
//       id: map['id'] as String,
//       name: map['name'] as String,
//       desc: map['description'] as String,
//       date: map['date'] as String,
//       time: map['time'] as String,
//       imagePath: map['imagePath'] as String,
//     );
//   }
//
//   TaskModel copyWith({
//     String? id,
//     String? name,
//     String? desc,
//     String? date,
//     String? time,
//     String? imagePath,
//     bool? isSelected,
//   }) {
//     return TaskModel(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       desc: desc ?? this.desc,
//       date: date ?? this.date,
//       time: time ?? this.time,
//       imagePath: imagePath ?? this.imagePath,
//       isSelected: isSelected ?? this.isSelected,
//     );
//   }
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//           other is TaskModel &&
//               runtimeType == other.runtimeType &&
//               id == other.id &&
//               name == other.name &&
//               desc == other.desc &&
//               date == other.date &&
//               time == other.time &&
//               imagePath == other.imagePath &&
//               isSelected == other.isSelected;
//
//   @override
//   int get hashCode =>
//       id.hashCode ^
//       name.hashCode ^
//       desc.hashCode ^
//       date.hashCode ^
//       time.hashCode ^
//       imagePath.hashCode ^
//       isSelected.hashCode;
// }