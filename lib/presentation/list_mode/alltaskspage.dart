import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_ash/presentation/new_task/new_task.dart';

import 'package:flutter/material.dart';
import '../../bloc/todo_bloc.dart';

import '../../core/utils/color_constant.dart';
import '../../database/db_helper.dart';
import '../selcted/selected.dart';

class AllTasksPage extends StatefulWidget {
  @override
  _AllTasksPageState createState() => _AllTasksPageState();
}

class _AllTasksPageState extends State<AllTasksPage> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(ShowDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Tasks'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoadedState) {
            return ListView.builder(
              itemCount: state.todoItems.length,
              itemBuilder: (context, index) {
                final helper = state.todoItems[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ListTile(
                          leading:Image.asset(helper.imagePath),
                          title: Text(helper.name),
                          subtitle: Text(helper.desc??'null'),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(helper.date),
                              Text(helper.time),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: ColorConstant.gradient_vaiolet

              ),
              child: IconButton(
                icon: Icon(Icons.check_sharp,color: Colors.white,),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => NewTaskPage()),
                  );
                },
              ),
            ),
            Container(height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
               color:ColorConstant.whiteA70000

              ),
              child: IconButton(
                icon: Icon(Icons.calendar_today_outlined,color: Colors.red,),
                onPressed: () {
                },
              ),
            ),
            Container(height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: ColorConstant.gradient

              ),
              child: IconButton(
                icon: Icon(Icons.add,color: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SelectedPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}