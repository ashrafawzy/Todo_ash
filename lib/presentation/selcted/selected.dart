// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todo_ash/presentation/new_task/new_task.dart';
// import 'package:todo_ash/presentation/shared/bloc/states.dart';
// import 'package:flutter/material.dart';
// import '../../bloc/todo_bloc.dart';
// import '../../core/utils/color_constant.dart';
// class SelectPage extends StatefulWidget{
//   @override
//   State<SelectPage> createState() => _SelectPageState();
// }
//
// class _SelectPageState extends State<SelectPage> {
//
//   List<todoItems> _selectedTasks = [];
//   TodoLoadedState _currentState = TodoLoadedState([todoItems], todoItems: [], items: []);
//
//   @override
//   void _deleteSelectedTasks() {
//     final bloc = TodoBloc.get(context);
//     bloc.add(DeleteSelectedDataEvent());
//   }
//   Widget build(BuildContext context) {
//     return BlocProvider<TodoBloc>(
//       create: (context) => TodoBloc(dbHelper: null!),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('All Tasks'),
//         ),
//         body: BlocBuilder<TodoBloc, TodoState>(
//           builder: (context, state) {
//     if (state is TodoLoadedState) {
//     return ListView.builder(
//     itemCount: state.items.length,
//     itemBuilder: (context, index) {
//     final helper = state.items[index];
//
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           ListTile(
//                             leading: Image(image: AssetImage(helper.imagePath)),
//                             title:  Text(helper.desc),
//                             trailing: Checkbox(
//                               shape: RoundedRectangleBorder(side: BorderSide(width: 40)),
//                               value: helper.selected,
//                               onChanged: (bool? value) {
//                                 setState(() {
//                                   helper.selected = value!;
//                                 });
//                               },
//                             ),
//                             onTap: () {
//                               setState(() {
//                                 helper.selected = !helper.selected;
//                               });
//                             },
//                             contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             } else {
//               return const Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//         bottomNavigationBar: BottomAppBar(
//           height: 65,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   height: 40,
//                   width: 40,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     gradient: ColorConstant.gradient_black,
//                   ),
//                   child: IconButton(
//                     icon: Icon(Icons.close,color: Colors.white,),
//                     onPressed: () {
//                       setState(() {
//                         _selectedTasks = [];
//                         final updatedList = _currentState.items.map((item) =>
//                             item.copyWith(isSelected: false)
//                         ).toList();
//                         final newState = TodoLoadedState(updatedList, todoItems: [], items: [], todoModel: null!);
//                         BlocProvider.of<TodoBloc>(context).add(UpdateDataEvent(todoItems as todoItems));
//                       });
//                     },
//                   ),
//                 ),
//               ),
//
//               Container(
//                 height: 40,
//                 width: 40,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   gradient: ColorConstant.gradient_vaiolet,
//                 ),
//                 child: IconButton(
//                   icon: Icon(Icons.check_sharp,color: Colors.white),
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => NewTaskPage()),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }