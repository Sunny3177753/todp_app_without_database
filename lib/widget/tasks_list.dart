import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/task_bloc.dart';
import '../model_class/todo_model.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskBloc taskBloc = BlocProvider.of<TaskBloc>(context);
    return Expanded(
      child: BlocConsumer<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state is TaskAddedSuccessfullyState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.green,
                duration: Duration(milliseconds: 500),
              ),
            );
          } else if (state is TaskDeletedSuccessfullyState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.red,
                duration: Duration(milliseconds: 500),
              ),
            );
          }
        },
        builder: (context, state) {
          List<Task> taskList = state.allTasks;
          return ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              var task = taskList[index];
              return ListTile(
                splashColor: Colors.red,
                onLongPress: () {
                  taskBloc.add(DeleteTaskEvent(task: task));
                },
                title: Text(task.title),
                trailing: Checkbox(
                  value: task.isDone,
                  onChanged: (value) {
                    taskBloc.add(UpdateTaskEvent(task: task));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
