import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/database/db.dart';

import '../database/task.dart';

class TaskController extends GetxController {
  TextEditingController inputCtrl = TextEditingController();
  var allTasks = <Task>[].obs;
  var isFetching = false.obs;

  void addNewTask() async {
    if (inputCtrl.text.isEmpty) {
      showNotice(msg: 'Enter task content');
      return;
    }

    var database = Database();
    await database.saveTask(Task()..taskName = inputCtrl.text).then((value) {
      Get.back();
      inputCtrl.clear();
      showNotice(msg: 'Task saved successfully!');
    });
  }

  Future<void> getAllTasks() async {
    isFetching.value = true;
    var database = Database();
    allTasks.value = await database.getAllTasks();
  }

  void markComplete(Task task, bool isComplete) async {
    var database = Database();

    task.taskCompleted = isComplete;
    await database.updateTask(task);
    
  }

  void showNotice({required String msg, int duration = 4}) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: const Color.fromARGB(255, 216, 211, 211),
        messageText: Text(
          msg,
          style: const TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: duration),
      ),
    );
  }
}
