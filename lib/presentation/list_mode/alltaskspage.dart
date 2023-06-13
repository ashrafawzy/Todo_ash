import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_ash/presentation/shared/bloc/states.dart';
import 'package:flutter/material.dart';
import '../shared/bloc/cubit.dart';
class AllTasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Tasks'),
      ),
      body: BlocBuilder<appCubit, States>(
        builder: (context, state) {
          if (state is GetDatafromDB) {
            final newTasks = (context.read<appCubit>().NewTasks);
            final doneTasks = (context.read<appCubit>().DoneTasks);
            final archivedTasks = (context.read<appCubit>().ArchivedTasks);
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: doneTasks.length,
                    itemBuilder: (context, index) {
                      final task = doneTasks[index];
                      return ListTile(
                        leading: Image(image: AssetImage(task[Image])),
                        title: Text(task['Name']),
                        subtitle: Text(task['Descraption']),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(task['Date']),
                            Text(task['Time']),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: doneTasks.length,
                //     itemBuilder: (context, index) {
                //       final task = doneTasks[index];
                //       return ListTile(
                //         leading: Image(image: AssetImage(task[Image])),
                //         title: Text(task['Name']),
                //         subtitle: Text(task['Descraption']),
                //         trailing: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text(task['Date']),
                //             Text(task['Time']),
                //           ],
                //         ),
                //       );
                //     },
                //   ),
                // ),
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: archivedTasks.length,
                //     itemBuilder: (context, index) {
                //       final task = archivedTasks[index];
                //       return ListTile(
                //         leading: Image(image: AssetImage(task[Image])),
                //         title: Text(task['Name']),
                //         subtitle: Text(task['Descraption']),
                //         trailing: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text(task['Date']),
                //             Text(task['Time']),
                //           ],
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}