import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_complete/theme_cubit/theme_cubit.dart';

import '../widget/add_task_screen.dart';
import '../widget/tasks_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController titleController = TextEditingController();

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AddTaskScreen(titleController: titleController),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context);
    // final TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo app'),
        actions: [
          BlocBuilder<ThemeCubit, ThemeState>(
            bloc: themeCubit,
            builder: (context, state) {
              return IconButton(
                onPressed: themeCubit.toggleTheme,
                icon: Icon(
                  state.isDark ? Icons.light_mode_rounded : Icons.dark_mode,
                ),
              );
            },
          ),
        ],
        centerTitle: true,
        elevation: 5,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Chip(
              label: Text("Tasks : "),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
              ),
            ),
          ),
          TasksList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTask(context);
        },
        splashColor: Colors.blue,
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
