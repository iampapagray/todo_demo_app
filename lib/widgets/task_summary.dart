import 'package:flutter/material.dart';

class TaskSummary extends StatelessWidget {
  const TaskSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 360,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 31, 29, 29),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tasks Summary',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
