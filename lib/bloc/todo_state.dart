part of 'todo_bloc.dart';

class TodoState extends Equatable {

  @override
  final List<TaskModel> todoItems;

  TodoState({required this.todoItems});

  @override
  List<Object?> get props => [todoItems];

}
class TodoLoadedState extends TodoState {
  final List<TaskModel> tasklist;

  TodoLoadedState(this.tasklist, {required List<TaskModel> list, required List<TaskModel> todoItems, required List todoItemsList} ) : super(todoItems: null!) ;

  @override
  List<Object> get props => [tasklist];
}
