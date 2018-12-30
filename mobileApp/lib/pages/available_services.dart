import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import '../pages/selected_services.dart';



class MyHomePage extends StatefulWidget {
  final String url;

  const MyHomePage({Key key, this.url}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data;
  Set<String> clickedServices = new Set();

  Future<String> getData() async {
    var res = await http
        .get(Uri.encodeFull(widget.url + "services"), headers: {"Accept": "application/json", "key": "RANDOM KEY"});

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

  //For a dynamic color on the buttons
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
      backgroundColor: new Color.fromRGBO(240, 240, 240, 4),
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
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.only(
                                        topLeft: const Radius.circular(2.0),
                                        topRight: const Radius.circular(2.0),
                                        bottomLeft: const Radius.circular(2.0),
                                        bottomRight: const Radius.circular(2.0))),
                                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
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
              color: Colors.amberAccent,
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),
              elevation: 6.0,
              onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ServicePage(clickedServices: clickedServices, url:widget.url))),
              child: new Text("Check My Queue"),
            ),
          )
        ],
      ),
    );
  }
}