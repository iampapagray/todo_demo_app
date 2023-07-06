// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/task_controller.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    TaskController taskCtrl = Get.find<TaskController>();

    return Column(
      children: [
        SizedBox(height: height * 0.15),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Hero(
              tag: 'add-new-tag',
              child: Material(
                elevation: 3,
                color: const Color.fromARGB(255, 31, 29, 29),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Text(
                          'What do you want to do next?',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Divider(
                          color: Colors.white60,
                          thickness: 0.3,
                        ),
                        TextField(
                          autofocus: true,
                          controller: taskCtrl.inputCtrl,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'New task...',
                            hintStyle: TextStyle(
                              color: Colors.white60,
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                          maxLines: 3,
                          maxLength: 100,
                        ),
                        const Divider(
                          color: Colors.white60,
                          thickness: 0.3,
                        ),
                        TextButton(
                          onPressed: () {
                            taskCtrl.addNewTask();
                          },
                          child: const Text(
                            'Add New',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
