import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: ProjectColors.backgroundColor,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: ProjectColors.accentColor,
                  backgroundImage: AssetImage('images/foto.jpg'),
                  //TODO get a better looking picture
                ),
                Text(
                  TextStrings.name,
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: ProjectColors.accentColor,
                  ),
                ),
                Text(
                  TextStrings.role,
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: ProjectColors.dividerColor,
                    letterSpacing: 2.5,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Divider(color: ProjectColors.dividerColor),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(25, 15, 25, 5),
                  color: ProjectColors.accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: ProjectColors.backgroundColor,
                      ),
                      title: Text(
                        TextStrings.phoneNumber,
                        style: TextStyle(
                          color: ProjectColors.cardTextColor,
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(25, 5, 25, 15),
                  color: ProjectColors.accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: ProjectColors.backgroundColor,
                      ),
                      title: Text(
                        TextStrings.email,
                        style: TextStyle(
                          color: ProjectColors.cardTextColor,
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

abstract class TextStrings {
  static final String name = 'Matheus Soares';
  static final String role = 'FLUTTER DEVELOPER';
  static final String phoneNumber = '+55 98 99232 8582';
  static final String email = 'matheus.soares.8d@gmail.com';
}

abstract class ProjectColors {
  static final Color backgroundColor = Colors.deepPurple;
  static final Color accentColor = Colors.white;
  static final Color dividerColor = Colors.deepPurple[100];
  static final Color cardTextColor = Colors.deepPurple[900];
}
