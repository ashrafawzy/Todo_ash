// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../presentation/new_task/new_task_cubit/add_todo_cubit.dart';
//
// class TaskTile extends StatelessWidget {
//   final int index;
//   final ValueChanged<bool?> onCheckChangedCallbackListener;
//   final VoidCallback onDeleteCallbackListener;
//
//   const TaskTile(this.onCheckChangedCallbackListener, this.onDeleteCallbackListener,
//       this.index,
//       {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final taskModel = context.read<TaskCubit>().state.taskModel;
//
//     return ListTile(
//       onLongPress: onDeleteCallbackListener,
//       title: Text(
//         taskModel.taskList[index].Image,
//         style: TextStyle(
//             decoration: taskModel.taskList[index].isCompleted
//                 ? TextDecoration.lineThrough
//                 : TextDecoration.none),
//       ),
//       trailing: Checkbox(
//         activeColor: Colors.orange,
//         value: taskModel.taskList[index].isCompleted,
//         onChanged: onCheckChangedCallbackListener,
//       ),
//     );
//   }
// }