import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // ?
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      // accentColor: Colors.cyan
    ),
    home: MyApp(),
  ),);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _gameNameController = TextEditingController();
  final _gameDeveloperController = TextEditingController();
  final _gameGenresController = TextEditingController();
  final _gameReleaseController = TextEditingController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  createData() async {
    Map<String, dynamic> g ={
      "name": _gameNameController.text,
      "developer": _gameDeveloperController.text,
      "genres": _gameGenresController.text,
      "release": double.parse(_gameReleaseController.text)
    };
    await _db.collection("Games").doc(_gameNameController.text).set(g)
    .then((value) => print("created"))
        .catchError((error) => print("Failed to add GAME: $error")
    );
    // print(st);
    // print("created");
  }

  readData() async {
    await _db.collection("Games").doc(_gameNameController.text).
    get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
    });
  }
  updateData() async {
    Map<String, dynamic> g ={
      "developer": _gameDeveloperController.text,
      "genres": _gameGenresController.text,
      "release": double.parse(_gameReleaseController.text)
    };
    await _db.collection("Games").doc(_gameNameController.text).update(g)
        .then((value) => print("Updated"))
        .catchError((error) => print("Failed to update game: $error"));
  }
  deleteData() async{
    await _db.collection("Games").doc(_gameNameController.text).delete()
        .then((value) => print("Deleted"))
        .catchError((error) => print("Failed to delete game: $error"));
  }
  @override
  Widget build(BuildContext context) {
    // CollectionReference firebaseStudents = FirebaseFirestore.instance.collection('Students');
    return Scaffold(
      resizeToAvoidBottomInset: false,  // 解決鍵盤遮擋輸入框的問題
      appBar: AppBar(
        title: const Text("My Flutter APP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                controller: _gameNameController,
                decoration: const InputDecoration(
                  label: Text("Name"),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width: 2.0)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                controller: _gameDeveloperController,
                decoration: const InputDecoration(
                  label: Text("Developer"),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue,
                          width: 2.0)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                controller: _gameGenresController,
                decoration: const InputDecoration(
                  label: Text("Genres"),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue,
                          width: 2.0)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                controller: _gameReleaseController,
                decoration: const InputDecoration(
                  label: Text("Release"),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue,
                          width: 2.0)
                  ),
                ),
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
                  child: const Text(
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
                  child: const Text(
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
                  child: const Text(
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
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

