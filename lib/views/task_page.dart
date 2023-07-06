import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/widgets/task_tile.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.black,
          tooltip: 'Add',
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: ListView(
          children: const [
            TaskTile(),
            TaskTile(),
            TaskTile(),
            TaskTile(),
          ],
        ));
  }
}
