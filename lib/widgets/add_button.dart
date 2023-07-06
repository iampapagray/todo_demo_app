import 'package:flutter/material.dart';
import 'package:todo_app/hero_route.dart';
import 'package:todo_app/widgets/add_todo.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: FloatingActionButton(
        heroTag: 'add-new-tag',
        onPressed: () {
          Navigator.push(context, HeroDialogRoute(builder: (context) {
            return const AddTodo();
          }));
        },
        backgroundColor: Colors.black,
        tooltip: 'Add',
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
