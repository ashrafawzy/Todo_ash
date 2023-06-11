

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/color_constant.dart';
import '../../models/Listviews.dart';
import '../new_task/new_task.dart';
import '../new_task/new_task_cubit/add_todo_cubit.dart';
import '../selcted/selcted_cubit/todo_cubit.dart';

class ListMode extends StatelessWidget {
  const ListMode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title:
        Text('TODO',style: TextStyle(fontSize: 20,color: Colors.black),),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewTaskPage()),
              );
            },
          ),
        ],
      ),
      body: Stack(
          children:[ Container(
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.taskModel.taskList.length,
                  itemBuilder: (context, index) {
                    var task = state.taskModel.taskList[index];
                    return ListTile(
                      leading: Image(image: AssetImage(task.Image)),
                      title: Text(task.Name),
                      subtitle: Text(task.Descraption),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(task.Date),
                          Text(task.Time),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.grey[200],
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Icon button with gradient color

                    Container(height:46,width: 46,
                      decoration: BoxDecoration(
                        gradient: ColorConstant.gradient2,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            blurRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),

                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.done,color: Colors.white,
                            size: 30,
                          ),
                        ),
                    ),

                    // Regular icon button
                    Container(height:46,width: 46,
                      decoration: BoxDecoration(
                       color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            blurRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),

                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.calendar_today_rounded),
                      ),
                    ),
                    Container(height:46,width: 46,
                      decoration: BoxDecoration(
                        gradient: ColorConstant.gradient,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            blurRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),]
      ),
    );
  }
}