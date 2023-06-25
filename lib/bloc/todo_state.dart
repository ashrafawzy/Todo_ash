part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<TaskModel> taskList;

  const TodoState({required this.taskList});

  @override
  List<Object?> get props => [taskList];
  Stream<TodoState> _mapAddDataEventToState(AddDataEvent event) async* {
    final TaskModel = event.TaskModel;



    final taskList = await DBHelper.selectAll(DBHelper.dbName);

    final Task =
    taskList.map((e) => TaskModel.fromMap(e)).toList();


  }
}
class TodoLoadedState extends TodoState {
  final List<Task> tasklist;

  TodoLoadedState(updatedList, this.tasklist, {  required todoModel, required List<Task> Task, required super.taskList}) ;

  @override
  List<Object> get props => [taskList];
}