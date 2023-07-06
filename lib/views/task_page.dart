import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/widgets/add_button.dart';
import 'package:todo_app/widgets/task_tile.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    TaskController taskCtrl = Get.find<TaskController>();

    taskCtrl.getAllTasks().then((_) {
      taskCtrl.isFetching.value = false;
      print('Total: ${taskCtrl.allTasks.length}');
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          onPressed: () {
            Get.toNamed('/home');
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 230, 237, 240),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const AddButton(),
      body: Obx(
        () => taskCtrl.isFetching.value
            ? const SizedBox()
            : ListView.builder(
                itemCount: taskCtrl.allTasks.length,
                itemBuilder: (context, index) {
                  return TaskTile(task: taskCtrl.allTasks[index]);
                },
              ),
      ),
    );
  }
}
