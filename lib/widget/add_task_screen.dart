import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_complete/bloc/task_bloc.dart';
import 'package:todo_app_complete/model_class/todo_model.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key, required this.titleController});

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text(
              "Add task",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 50),
            TextField(
              controller: titleController,
              autofocus: true,
              decoration: InputDecoration(
                label: const Text('Title'),
                hintText: 'Enter Title',

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),

                ///Add task button
                ElevatedButton(
                  onPressed: () {
                    var task = Task(title: titleController.text);
                    if (titleController.text.isNotEmpty) {
                      context.read<TaskBloc>().add(AddTaskEvent(task: task));
                      titleController.clear();
                    }
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
