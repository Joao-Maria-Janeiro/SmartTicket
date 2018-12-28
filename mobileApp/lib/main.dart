import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer timer;
  final String url = "https://smartticket.herokuapp.com/services";
  List data;

  Future<String> getData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json", "key": "RANDOM KEY"});

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody;
      print(data);
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => getData());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }


  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smart Tickets"),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          children: <Widget>[
                            Text("Name: "),
                            Text(data[index]["name"],
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black87)),
                            Text("Current Ticket: "),
                            Text((data[index]["current_ticket"]).toString(),
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.red)),
                            Text("Latest Retrived Ticket: "),
                            Text((data[index]["latest_retrived_ticket"]).toString(),
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black87)),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}