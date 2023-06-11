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
  final List<Task> taskList;

  TaskModel({required this.taskList});

  int taskCount() => taskList.length;
}
class Task {
  String Image;
  String Name;
  String Descraption;
  String Date;
  String Time;
  Task({required this.Image, required this.Name,required this.Descraption,required this.Date,required this.Time});

  void toggleTask() {
    // isCompleted = isCompleted == true ? false : true;
  }
}