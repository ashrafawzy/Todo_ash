import 'package:todo_ash/models/Listviews.dart';

abstract class States{}

class InitialState extends States{}

class ChangeNavBar extends States{}

class CreateDB extends States{}

class InsertIntoDB extends States{}

class GetDatafromDB extends States{}

class UpdateDB extends States{}

class DeleteFromDB extends States{}

class ChangeIconState extends States{}

class ChangeBottomSheetState extends States{}

class AppGetDatabaseLoadingState extends States{}

class InsertNewTaskSuccessState extends States{}
class InsertNewTaskErrorState extends States{}
class UpdateTaskSuccessState extends States{}
class UpdateTaskErrorState extends States{}
class DeleteTaskSuccessState extends States{}
class DeleteTaskErrorState extends States{}
class TasksLoaded extends States{
  TasksLoaded(List<Task> tasks);
}