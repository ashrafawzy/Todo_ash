import '../core/utils/image_constant.dart';
import 'database.dart';

List<String> images = [
  ImageConstant.shoping,
  ImageConstant.basket,
ImageConstant.parking,
  ImageConstant.berthday,
  ImageConstant.gym,
  ImageConstant.dote,
];

class TaskModel {
  final List<Task> _tasks = [];

  TaskModel({required String imagePath, required String Name, required String Description, required String Date, required String Time});

  int taskCount() => _tasks.length;
}
class Task {
  String imagePath;
  String name;
  String descraption;
  String date;
  String time;
  Task({required this.imagePath, required this.name,required this.descraption,required this.date,required this.time});

  void toggleTask() {
    // isCompleted = isCompleted == true ? false : true;
  }
}