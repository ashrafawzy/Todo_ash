import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calendar_cubit_state.dart';

class CalendarCubitCubit extends Cubit<CalendarCubitState> {
  CalendarCubitCubit() : super(CalendarCubitInitial());

  
}
