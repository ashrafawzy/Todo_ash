import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_ash/model/Listviews.dart';
import 'package:todo_ash/presentation/new_task/new_task.dart';

import '../../bloc/todo_bloc.dart';
import '../../core/utils/color_constant.dart';



class SelectedPage extends StatefulWidget {
  @override
  _SelectedPageState createState() => _SelectedPageState();
}

class _SelectedPageState extends State<SelectedPage> {
  bool _selectAll = false;
  bool? isCompleted = false;

  void handleChange(bool? value) {
    setState(() {
      isCompleted = value;
    });
  }
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
              itemCount: state.tasklist.length,
              itemBuilder: (context, index) {
                final helper = state.tasklist[index];
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
                          Checkbox(
                            shape: const ContinuousRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            value: isCompleted,
                            onChanged: (value) {
                              setState(() {
                                isCompleted = value;
                              });
                            },
                          ),
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
      bottomNavigationBar: BottomAppBar(
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: ColorConstant.gradient_vaiolet,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.check_sharp,
                  color: Colors.white,
                ),
                onPressed: () {
                  // setState(() {
                  //   _selectAll = !_selectAll;
                  // });
                  // context.read<TodoBloc>().add(CheckAllEvent(_selectAll));
                },
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorConstant.whiteA70000,
              ),
              child: ElevatedButton(
                onPressed: () {
                  context.read<TodoBloc>().add(DeleteSelectedEvent());
                },
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
              )
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: ColorConstant.gradient,
              ),
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => NewTaskPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}