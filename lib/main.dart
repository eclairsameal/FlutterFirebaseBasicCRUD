import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false, // ?
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      // accentColor: Colors.cyan
    ),
  home: MyApp(),
  ),);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String studentName, studentID, studentProgramID;
  late double studentGPA;

  getStudentName(_name){
    this.studentName = _name;
  }
  getStudentId(_id){
    this.studentID = _id;
  }
  getStudentProgramId(_programId){
    this.studentProgramID = _programId;
  }
  getStudentGPA(_gpa){
    this.studentGPA = _gpa;
  }
  createData(){
    print("created");
  }
  readData(){
    print("read");
  }
  updateData(){
    print("updated");
  }
  deleteData(){
    print("deleted");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,  // 解決鍵盤遮擋輸入框的問題
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
                  getStudentName(name);
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
                  getStudentId(id);
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
                onChanged: (String programId){
                  getStudentProgramId(programId);
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
                  getStudentGPA(gpa);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    createData();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 16,
                  ),
                  child: Text(
                    'Create',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    readData();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 16,
                  ),
                  child: Text(
                    'Read',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    updateData();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 16,
                  ),
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    deleteData();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 16,
                  ),
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),

                // RaisedButton(
                //   color: Colors.green,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(16),
                //   ),
                //   child: Text("Create"),
                //   textColor: Colors.white,
                //   onPressed: () {
                //     createData();
                //   },
                // ),
                // RaisedButton(
                //   color: Colors.blue,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(16),
                //   ),
                //   child: Text("Read"),
                //   textColor: Colors.white,
                //   onPressed: () {
                //     readData();
                //   },
                // ),
                // RaisedButton(
                //   color: Colors.amber,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(16),
                //   ),
                //   child: Text("Update"),
                //   textColor: Colors.white,
                //   onPressed: () {
                //     updateData();
                //   },
                // ),
                // RaisedButton(
                //   color: Colors.red,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(16),
                //   ),
                //   child: Text("Delete"),
                //   textColor: Colors.white,
                //   onPressed: () {
                //     deleteData();
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

