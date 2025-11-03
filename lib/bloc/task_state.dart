part of 'task_bloc.dart';

@immutable
class TaskState extends Equatable {
  final List<Task> allTasks;
  const TaskState({this.allTasks = const <Task>[]});
  @override
  List<Object> get props => [allTasks];
}

final class TaskAddedSuccessfullyState extends TaskState {
  final String message;
  const TaskAddedSuccessfullyState({required this.message});
}

final class TaskDeletedSuccessfullyState extends TaskState {
  final String message;
  const TaskDeletedSuccessfullyState({required this.message});
}
