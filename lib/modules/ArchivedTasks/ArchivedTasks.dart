// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../components/components.dart';
// import '../../presentation/shared/bloc/cubit.dart';
// import '../../presentation/shared/bloc/states.dart';
//
//
// class archivedTasks extends StatelessWidget
// {
//   @override
//   Widget build(BuildContext context) {
//     appCubit cubit=appCubit.get(context);
//     return BlocConsumer<appCubit,States>(
//         builder: (context,State){
//           return tasksList(tasks: cubit.ArchivedTasks);
//         },
//         listener: (context,state){});
//     throw UnimplementedError();
//   }
//
// }