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
  final FirebaseFirestore _db = FirebaseFirestore.instance;  // Firestore 實例

  Widget buildCountList() {  // 測試用的
    return ListView.builder( // 適合列表項比較多或者列表項不確定的情況
      //shrinkWrap: true,
        itemCount: 5,
        itemExtent: 50.0, // 强制高度为50.0
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        }
    );
  }
  
  Widget buildAllDataList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _db.collection("Games").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {

            return CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            );
          }else {
            print('alllllllllllllllllllllllllllll');
            print(snapshot.data?.docs.length);
            print(snapshot.data?.docs[0]['name']);
            return ListView.builder( // 適合列表項比較多或者列表項不確定的情況
              //shrinkWrap: true,
                itemCount: snapshot.data?.docs.length, // 資料庫裡資料筆數
                itemExtent: 50.0, // 强制高度为50.0
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Text(snapshot.data?.docs[index]['name'])
                  );
                }
            );



          }
        },
    );
  }
  
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
  readData() async {   // 一次性讀取
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
                    backgroundColor: Colors.red,
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
                    backgroundColor: Colors.green,
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
                    backgroundColor: Colors.amber,
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
            // StreamBuilder(
            //   stream: _db.collection("Games").snapshots(),
            //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            //     if (snapshot.hasData) {
            //       return ListView.builder(
            //           itemCount:snapshot.data?.docs.length,
            //           itemBuilder:(context, index) {
            //             return ListTile(
            //               title: Text(snapshot.data?.docs[index]['name']),
            //               subtitle: Text(snapshot.data?.docs[index]['developer']),
            //             );
            //           }
            //       );
            //     }
            //     return Text("No widget to build");
            //   }
            // ),


            Expanded(  // Expanded小部件使內容佔據所有可用空間。
              // child: ListView.builder( // 適合列表項比較多或者列表項不確定的情況
              //   //shrinkWrap: true,
              //   itemCount: 5,
              //   itemExtent: 50.0, // 强制高度为50.0
              //   itemBuilder: (BuildContext context, int index) {
              //     return ListTile(title: Text("$index"));
              //   }
              // ),
              child:
                //buildCountList()
                buildAllDataList(),
            ),



          ],
        ),
      ),
    );
  }
}

