import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import './pages/services.dart';


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
  final String url = "https://smartticket.herokuapp.com/services";
  List data;
  Set<String> clickedServices = new Set();

  Future<String> getData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json", "key": "RANDOM KEY"});

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody;
    });

    return "Success!";
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Color getColor(String text) {
    if (text == "Charcutaria") {
      return Colors.orange;
    } else if(text == "Talho") {
      return Colors.red;
    } else if(text == "Peixaria") {
      return Colors.cyan;
    } else if(text == "TakeAway") {
      return Colors.amber;
    }else {
      return Colors.grey;
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smart Tickets"),
        backgroundColor: Colors.amberAccent,
      ),
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                child: Center(
                  child: new InkWell(
                    onTap: () => clickedServices.add(data[index]["name"]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Card(
                          child: Container(
                              decoration: new BoxDecoration(
                                  color: getColor(data[index]["name"]),
                                  borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(12.0),
                                      topRight: const Radius.circular(12.0),
                                      bottomLeft: const Radius.circular(12.0),
                                      bottomRight: const Radius.circular(12.0))),
                              margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                children: <Widget>[
                                  Text(data[index]["name"],
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          ),
            new Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              height: 50.0,
              child: RaisedButton(
                color: Colors.lightGreen,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
                elevation: 6.0,
                onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ServicePage(clickedServices: clickedServices))),
                child: new Text("Check My Queue"),
              ),
            )
        ],
      ),
    );
  }
}

