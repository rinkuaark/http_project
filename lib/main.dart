import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_project/model/outputObj.dart';
import 'dart:io';
import 'package:http_project/ui/chart.dart';
import 'package:http_project/ui/table.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[400],
            elevation: 15,
            title: Text("App Bar"),
          ),
          body: TableApp()),
    );
  }
}

class AppResponse extends StatefulWidget {
  @override
  _AppResponseState createState() => _AppResponseState();
}

class _AppResponseState extends State<AppResponse> {
  String url;

  Future<void> getMoreData() async {
    final response =
        await http.get("https://jsonplaceholder.typicode.com/photos");
    Map<String, String> mapa = response.headers;

    print(mapa["content-type"]);
  }

  Future<OutputObj> getdata() async {
    String urla = "http://64.227.7.140/guardapp/api/guard/login";
    Map<String, String> headers = {"Content-type": "application/json"};
    String jsondata =
        '{"inputObj": {"u_email":"rinku@gmail.com","u_pwd":"123456"}}';
    var bodys = json.encode(jsondata);
    final res = await http.post(urla, headers: headers, body: jsondata);

    final decodeData = jsonDecode(res.body);

    OutputObj obj = new OutputObj.fromJson(decodeData);
    print(obj.outputObj.gid);
    // return jsonDecode(res.body)["outputObj"]["gtoken"];
    return obj;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            Container(
                color: Colors.white70,
                child: (Platform.isIOS)
                    ? CupertinoButton(child: Text("Button"), onPressed: () {})
                    : Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.orange,
                              offset: Offset(1, 15),
                              blurRadius: 32,
                              spreadRadius: -5)
                        ]),
                        child: RaisedButton(
                            splashColor: Colors.orange,
                            padding: EdgeInsets.symmetric(
                                horizontal: 45, vertical: 15),
                            color: Colors.orange,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text("Data"),
                                        content: Text("My Data"),
                                        actions: [
                                          FlatButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Ok")),
                                          FlatButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Cancel"))
                                        ],
                                      ));
                            },
                            child: Text(
                              "Button",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            )))),
            SizedBox(
              height: 25.0,
            ),
            FutureBuilder<OutputObj>(
                future: getdata(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    print(snapshot.data);
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error"),
                    );
                  } else if (snapshot.hasData) {
                    print(snapshot.data);
                    return AlertDialog(
                      title: Text("Data"),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                              "Gid: " + snapshot.data.outputObj.gid.toString()),
                          Text("Gloc: " +
                              snapshot.data.outputObj.gloc_id.toString()),
                          Text("Gloc_name: " +
                              snapshot.data.outputObj.gloc_name.toString()),
                          Text("Gloc_time: " +
                              snapshot.data.outputObj.gloc_timeout.toString()),
                          Text("GToken: " +
                              snapshot.data.outputObj.gtoken.toString()),
                        ],
                      ),
                      actions: [
                        FlatButton(
                          child: Text("Close"),
                          onPressed: () {},
                        )
                      ],
                    );
                    // return Container(
                    //   width: 250,
                    //   height: 250,
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           image: NetworkImage(snapshot.data))),
                    //   //  child:
                    // );
                  }
                }),
            // decoration:
            //     BoxDecoration(image: DecorationImage(image: NetworkImage())),
          ],
        ),
      ],
    );
  }
}
