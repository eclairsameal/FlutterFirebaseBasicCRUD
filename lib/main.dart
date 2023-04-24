import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.cyan
    ),
  home: MyApp(),
  ),);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Flutter APP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text("Name"),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width: 2.0)
                  ),
                ),
                onChanged: (String name){

                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text("Student ID"),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue,
                          width: 2.0)
                  ),
                ),
                onChanged: (String id){

                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text("Study Program ID"),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue,
                          width: 2.0)
                  ),
                ),
                onChanged: (String programID){

                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text("GPA"),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue,
                          width: 2.0)
                  ),
                ),
                onChanged: (String gpa){

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

