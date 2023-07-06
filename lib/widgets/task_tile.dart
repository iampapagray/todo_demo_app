import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/database/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    TaskController taskCtrl = Get.find<TaskController>();
    var isCompleted = task.taskCompleted.obs;
    var waitingTimer;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Obx(
                () => Text(
                  task.taskName,
                  style: TextStyle(
                    fontSize: 16,
                    decoration: isCompleted.value
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            ),
            RoundCheckBox(
              size: 24,
              checkedColor: Colors.black,
              borderColor: Colors.black,
              onTap: (isComplete) {
                isCompleted.value = isComplete!;
                if (isComplete) {
                  waitingTimer = Timer(const Duration(seconds: 5), () {
                    taskCtrl.markComplete(task, isComplete);
                  });
                } else {
                  if (waitingTimer != null) {
                    waitingTimer.cancel();
                  }
                  taskCtrl.markComplete(task, isComplete);
                }
                // taskCtrl.markComplete(task, isComplete);
              },
            )
          ],
        ),
      ),
    );
  }
}
