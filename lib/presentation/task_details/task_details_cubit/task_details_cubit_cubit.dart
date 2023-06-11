import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'task_details_cubit_state.dart';

class TaskDetailsCubitCubit extends Cubit<TaskDetailsCubitState> {
  TaskDetailsCubitCubit() : super(TaskDetailsCubitInitial());

  
}
