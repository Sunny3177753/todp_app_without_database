import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../model_class/todo_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState(allTasks: [])) {
    on<AddTaskEvent>(_onAddTaskEvent);
    on<UpdateTaskEvent>(_onUpdateTaskEvent);
    on<DeleteTaskEvent>(_onDeleteTaskEvent);
  }

  FutureOr<void> _onAddTaskEvent(AddTaskEvent event, Emitter<TaskState> emit) {
    // List<Task> updatedTask = state.allTasks;
    // updatedTask.add(event.task);
    // emit(TaskState(allTasks: updatedTask));
    final state = this.state;
    emit(TaskAddedSuccessfullyState(message: 'Added Successfully'));
    emit(TaskState(allTasks: List<Task>.from(state.allTasks)..add(event.task)));
  }

  FutureOr<void> _onUpdateTaskEvent(
    UpdateTaskEvent event,
    Emitter<TaskState> emit,
  ) {
    final updatedTasks = List<Task>.from(state.allTasks);
    final index = updatedTasks.indexOf(event.task);
    if (index != -1) {
      updatedTasks[index] = event.task.copyWith(isDone: !event.task.isDone!);
    }
    emit(TaskState(allTasks: updatedTasks));
  }

  FutureOr<void> _onDeleteTaskEvent(
    DeleteTaskEvent event,
    Emitter<TaskState> emit,
  ) {
    final updatedTask = List<Task>.from(state.allTasks);
    updatedTask.remove(event.task);
    emit(TaskDeletedSuccessfullyState(message: 'Deleted Successfully'));
    emit(TaskState(allTasks: updatedTask));
  }
}
