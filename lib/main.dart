import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datamahasiswa/splashscreen_view.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.red[900],
          accentColor: Colors.red[800]),
      home: SplashScreenPage(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String studentName, studentID, studyProgramID;
  double studentGPA;

  getStudentName(name) {
    this.studentName = name;
  }

  getStudentID(id) {
    this.studentID = id;
  }

  getStudyProgramID(programID) {
    this.studyProgramID = programID;
  }

  getStudentGPA(gpa) {
    this.studentGPA = double.parse(gpa);
  }

  createData() {
    DocumentReference documentReference =
        Firestore.instance.collection("MyStudents").document(studentName);

    // create Map
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA
    };

    documentReference.setData(students).whenComplete(() {
      print("$studentName created");
    });
  }

  // readData() {
  //   DocumentReference documentReference =
  //       Firestore.instance.collection("MyStudents").document(studentName);

  //   documentReference.get().then((datasnapshot) {
  //     print(datasnapshot.data["studentName"]);
  //     print(datasnapshot.data["studentID"]);
  //     print(datasnapshot.data["studyProgramID"]);
  //     print(datasnapshot.data["studentGPA"]);
  //   });
  // }

  updateData() {
    DocumentReference documentReference =
        Firestore.instance.collection("MyStudents").document(studentName);

    // create Map
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA
    };

    documentReference.setData(students).whenComplete(() {
      print("$studentName updated");
    });
  }

  deleteData() {
    DocumentReference documentReference =
        Firestore.instance.collection("MyStudents").document(studentName);

    documentReference.delete().whenComplete(() {
      print("$studentName deleted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Data Mahasiswa"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Nama",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.red[900], width: 2.0))),
                onChanged: (String name) {
                  getStudentName(name);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "NIM",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.red[900], width: 2.0))),
                onChanged: (String id) {
                  getStudentID(id);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Jurusan",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.red[900], width: 2.0))),
                onChanged: (String programID) {
                  getStudyProgramID(programID);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "IPK",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.red[900], width: 2.0))),
                onChanged: (String gpa) {
                  getStudentGPA(gpa);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: RaisedButton.icon(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    label: Text("Create"),
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    textColor: Colors.white,
                    onPressed: () {
                      createData();
                    },
                  ),
                ),
                // RaisedButton(
                //   color: Colors.blue,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(16)),
                //   child: Text("Read"),
                //   textColor: Colors.white,
                //   onPressed: () {
                //     readData();
                //   },
                // ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: RaisedButton.icon(
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    label: Text("Update"),
                    icon: Icon(
                      Icons.update,
                      color: Colors.white,
                    ),
                    textColor: Colors.white,
                    onPressed: () {
                      updateData();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: RaisedButton.icon(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    label: Text("Delete"),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    textColor: Colors.white,
                    onPressed: () {
                      deleteData();
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Nama",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "NIM",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Jurusan",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "IPK",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  )
                ],
              ),
            ),
            StreamBuilder(
              stream: Firestore.instance.collection("MyStudents").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data.documents[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(documentSnapshot["studentName"]),
                            ),
                            Expanded(
                              child: Text(documentSnapshot["studentID"]),
                            ),
                            Expanded(
                              child: Text(documentSnapshot["studyProgramID"]),
                            ),
                            Expanded(
                              child: Text(
                                  documentSnapshot["studentGPA"].toString()),
                            )
                          ],
                        );
                      });
                } else {
                  return Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
