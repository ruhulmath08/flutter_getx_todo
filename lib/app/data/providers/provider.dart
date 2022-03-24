import 'dart:convert';

import 'package:flutter_getx_todo/app/core/utils/keys.dart';
import 'package:flutter_getx_todo/app/data/models/task.dart';
import 'package:flutter_getx_todo/app/data/services/storage/services.dart';
import 'package:get/get.dart';

class TaskProvider {
  final StorageService _storage = Get.find<StorageService>();

  List<Task> readTask() {
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString()).forEach((e) {
      tasks.add(Task.formJson(e));
    });

    return tasks;
  }

  void writeTask(List<Task> tasks) {
    _storage.write(taskKey, jsonEncode(tasks));
  }
}
