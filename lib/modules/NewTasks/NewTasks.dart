// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todo_ash/presentation/selcted/selcted_cubit/todo_state.dart';
//
// import '../../components/components.dart';
// import '../../presentation/shared/bloc/cubit.dart';
// import '../../presentation/shared/bloc/states.dart';
//
// class newTasks extends StatelessWidget
// {
//   @override
//   Widget build(BuildContext context) {
//     appCubit cubit=appCubit.get(context);
//     return BlocConsumer<appCubit,States>(
//         builder: (context,State){
//           return tasksList(tasks: cubit.NewTasks);
//         },
//         listener: (context,state){});
//     throw UnimplementedError();
//   }
//
// }