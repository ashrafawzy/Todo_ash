part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class ShowDataEvent extends TodoEvent {
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}

class AddDataEvent extends TodoEvent {
  final String name;
  final String desc;
  final String date;
  final String time;
  final String imagePath;

  const AddDataEvent({
    required this.name,
    required this.desc,
    required this.date,
    required this.time,
    required this.imagePath,
  });

  @override
  @override
  List<Object?> get props => [TaskModel];

  get TaskModel => Task( name: name, desc: desc, date: date, time: time, imagePath: imagePath, id: '');

  AddDataEvent copyWith({
    String? name,
    String? desc,
    String? date,
    String? time,
    String? imagePath,

  }) {
    return AddDataEvent(
      name: name ?? this.name,
      desc: desc ?? this.desc,
      date: date ?? this.date,
      time: desc ?? this.time,
      imagePath: date ?? this.imagePath,
    );
  }
}

class UpdateDataEvent extends TodoEvent {
  final TaskModel taskModel;

  const UpdateDataEvent(this.taskModel);

  @override
  List<Object?> get props => [taskModel];
}

class DeleteDataEvent extends TodoEvent {
  final String id;

  const DeleteDataEvent({required this.id});

  DeleteDataEvent copyWith({String? id}) {
    return DeleteDataEvent(id: id ?? this.id);
  }

  @override
  List<Object> get props => [id];
}
// class DeleteSelectedDataEvent extends TodoEvent {}