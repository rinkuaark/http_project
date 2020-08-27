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
              tooltip: "This is Gender"),
          DataColumn(
              label: Text("Address",
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
                  DataCell(Text(user.add)),
                ]))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table Page"),
      ),
      body: Container(
          padding: EdgeInsets.all(16),
          child: Card(
            elevation: 20,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal, child: getDataTable()),
                ],
              ),
            ),
          )),
    );
  }
}

class User {
  int id;
  String firsname;
  String lastname;
  String gender;
  String add;

  User({this.id, this.firsname, this.lastname, this.gender, this.add});

  static List<User> getUserData() {
    return <User>[
      User(
          id: 1,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 2,
          firsname: "Robin",
          lastname: "Kamboj",
          gender: "M",
          add: "New"),
      User(
          id: 3,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 5,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 6,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 7,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
      User(
          id: 4,
          firsname: "Rinku",
          lastname: "Dhiman",
          gender: "M",
          add: "New"),
    ];
  }
}
