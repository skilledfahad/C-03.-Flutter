import 'package:flutter/material.dart';

import '../../data/models/task_list_model.dart';

class TaskListTileView extends StatelessWidget {

  final VoidCallback deleteTask, editTask;
  final Color taskConditionColor;
  final TaskData data;

  const TaskListTileView({super.key,
    required this.taskConditionColor,
    required this.data,
    required this.deleteTask, required this.editTask,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.only(left: 20,right: 10,top: 10),
        title: Text(data.title ?? 'Loading Error'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.description ?? 'Loading Error'),

            Padding(
              padding: const EdgeInsets.only(top: 8,bottom: 5),
              child: Text("Date: ${data.createdDate ?? 'Loading Error'}"),
            ),
            Row(
              children: [
                Chip(
                    label: Text(data.status ?? ' ',style: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold,letterSpacing: 1.5)),
                    backgroundColor: taskConditionColor, //todo: Changeable color taskConditionColor
                    labelPadding: const EdgeInsets.symmetric(horizontal: 25)),
                const Spacer(),
                IconButton(onPressed: editTask, icon: const Icon(Icons.edit_calendar,color: Colors.green,)),
                IconButton(onPressed: deleteTask, icon: const Icon(Icons.delete_rounded,color: Colors.red)),
              ],
            )
          ],
        ),
      ),
    );
  }
}