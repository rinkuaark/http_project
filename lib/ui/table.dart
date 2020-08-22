import 'package:flutter/material.dart';

class TableApp extends StatefulWidget {
  @override
  _TableAppState createState() => _TableAppState();
}

class _TableAppState extends State<TableApp> {
  List<User> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = User.getUserData();
  }

  DataTable getDataTable() {
    return DataTable(
        columns: [
          DataColumn(
              label: Text("ID",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w900)),
              numeric: false,
              tooltip: "This is ID"),
          DataColumn(
            label: Text(
              "First Name",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
            ),
            numeric: false,
            tooltip: "This is First name",
          ),
          DataColumn(
              label: Text("Last Name",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w900)),
              numeric: false,
              tooltip: "This is Last Name"),
          DataColumn(
              label: Text("Gender",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w900)),
              numeric: false,
              tooltip: "This is Gender")
        ],
        rows: list
            .map((user) => DataRow(cells: [
                  DataCell(Text(user.id.toString())),
                  DataCell(Text(user.firsname)),
                  DataCell(Text(user.lastname)),
                  DataCell(Text(user.gender)),
                ]))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 20,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(8.0),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  getDataTable(),
                ],
              ),
            ),
          ),
        ));
  }
}

class User {
  int id;
  String firsname;
  String lastname;
  String gender;

  User({this.id, this.firsname, this.lastname, this.gender});

  static List<User> getUserData() {
    return <User>[
      User(id: 1, firsname: "Rinku", lastname: "Dhiman", gender: "M"),
      User(id: 2, firsname: "Robin", lastname: "Kamboj", gender: "M"),
      User(id: 3, firsname: "Rinku", lastname: "Dhiman", gender: "M"),
      User(id: 4, firsname: "Rinku", lastname: "Dhiman", gender: "M"),
      User(id: 5, firsname: "Rinku", lastname: "Dhiman", gender: "M"),
      User(id: 6, firsname: "Rinku", lastname: "Dhiman", gender: "M"),
      User(id: 7, firsname: "Rinku", lastname: "Dhiman", gender: "M"),
      User(id: 4, firsname: "Rinku", lastname: "Dhiman", gender: "M"),
      User(id: 4, firsname: "Rinku", lastname: "Dhiman", gender: "M"),
      User(id: 4, firsname: "Rinku", lastname: "Dhiman", gender: "M"),
      User(id: 4, firsname: "Rinku", lastname: "Dhiman", gender: "M"),
      User(id: 4, firsname: "Rinku", lastname: "Dhiman", gender: "M"),
      User(id: 4, firsname: "Rinku", lastname: "Dhiman", gender: "M"),
      User(id: 4, firsname: "Rinku", lastname: "Dhiman", gender: "M"),
      User(id: 4, firsname: "Rinku", lastname: "Dhiman", gender: "M"),
    ];
  }
}
