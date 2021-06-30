import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return SingleChildScrollView(
      child: Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          decoration: BoxDecoration(
            color: kAccentColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(color: kBackgroundColor, fontSize: 26.0),
              ),
              TextField(
                textAlign: TextAlign.center,
                autofocus: true,
                decoration: InputDecoration(fillColor: kBackgroundColor),
                onChanged: (value) => newTaskTitle = value,
              ),
              SizedBox(height: 20),
              FlatButton(
                color: kBackgroundColor,
                onPressed: () {
                  if (newTaskTitle != null) {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Add',
                  style: TextStyle(color: kAccentColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
