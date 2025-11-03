import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  bool? isDone;
  bool? isDeleted;

  Task({required this.title, this.isDone, this.isDeleted}) {
    isDone ??= false;
    isDeleted ??= false;
  }

  Task copyWith({String? title, bool? isDone, bool? isDeleted}) {
    return Task(
      title: title ?? this.title,
      isDeleted: isDeleted ?? this.isDeleted,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'isDone': isDone, 'isDeleted': isDeleted};
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, isDone, isDeleted];
}
