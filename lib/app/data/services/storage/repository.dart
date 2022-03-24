import 'package:flutter_getx_todo/app/data/models/task.dart';
import 'package:flutter_getx_todo/app/data/providers/provider.dart';

class TaskRepository {
  TaskProvider taskProvider;

  TaskRepository({required this.taskProvider});

  List<Task> readTasks() => taskProvider.readTask();

  void writeTask(List<Task> tasks) => taskProvider.writeTask(tasks);
}
