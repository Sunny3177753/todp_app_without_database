import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_complete/bloc/task_bloc.dart';
import 'package:todo_app_complete/theme_cubit/theme_cubit.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => TaskBloc()),
      ],
      child: TodoApp(),
    ),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.blue[200],
            textTheme: TextTheme(
              titleSmall: TextStyle(color: Colors.black),
              bodyMedium: TextStyle(color: Colors.black),
              bodyLarge: TextStyle(color: Colors.black),
              bodySmall: TextStyle(color: Colors.black),
            ),
            appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
            textTheme: TextTheme(
              titleSmall: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white),
              bodyLarge: TextStyle(color: Colors.white),
              bodySmall: TextStyle(color: Colors.white),
            ),
            appBarTheme: AppBarTheme(backgroundColor: Colors.black),
          ),
          themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
          themeAnimationDuration: Duration(milliseconds: 400),
          home: HomePage(),
        );
      },
    );
  }
}
