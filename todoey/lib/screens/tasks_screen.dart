import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_list.dart';
import 'package:todoey/screens/add_task_screen.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<TaskData>(context).updateTasksLeft();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, bottom: 30.0, left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: kAccentColor,
                  radius: 30,
                  child: Icon(Icons.list, size: 30, color: kBackgroundColor),
                ),
                SizedBox(height: 10),
                Text('Todoey',
                    style: TextStyle(
                        color: kAccentColor,
                        fontSize: 50,
                        fontWeight: FontWeight.w700)),
                Text(
                  '${Provider.of<TaskData>(context).numTasksLeft}/${Provider.of<TaskData>(context).numTasks} tasks left', // TODO fix thit number that's not updating properly
                  style: TextStyle(
                    color: kAccentColor,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                //padding: EdgeInsets.only(bottom: 80),
                decoration: BoxDecoration(
                  color: kAccentColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: TaskList()),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBackgroundColor,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => AddTaskScreen());
        },
      ),
    );
  }
}
