import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';



class ServicePage extends StatefulWidget {

  final  Set<String> clickedServices;
  final String url;

  const ServicePage({Key key, this.clickedServices, this.url}) : super(key: key);

  @override
  State createState() => new ServicePageState();
}

class ServicePageState extends State<ServicePage> {
  List data;
  List data2;
  List filtered = new List();
  Timer timer;
  List tickets;

  Future<String> getData() async {
    var res = await http
        .get(Uri.encodeFull(widget.url + "services"), headers: {"Accept": "application/json", "key": "RANDOM KEY"});
    print("HHEEEEEEEEEEEEEEEEEERRRRRRRRRRRRRRRRRRRRRRRREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
    print(widget.url);
    print(widget.clickedServices);
    setState(() {
      var resBody = json.decode(res.body);
      data = resBody;
    });
    filtered.clear();
    filterData();

    return "Success!";
  }

  void filterData(){
    for (var i = 0; i < data.length; i++){
      if (widget.clickedServices.contains(data[i]["name"])){
        filtered.add(data[i]);
      }
    }
    print("FFFFFFFFFFFFFFFFFFFFFFFFFFIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
    getTickets();
  }

  Future<String> getTickets() async {
    if (tickets == null){
      tickets = new List();
      for (var i = 0; i < filtered.length; i++){
        String urlz = widget.url + "take/" + filtered[i]["name"];
        print("NNNNNNNNNNNNNNNNNNNNNNNNNNNNNOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
        print(urlz);
        var res = await http.get(Uri.encodeFull(urlz), headers: {"Accept": "application/json", "key": "RANDOM KEY"});
        var resBody = json.decode(res.body);
        var yourTicketValue = resBody["ticket"];
        tickets.add(yourTicketValue);
      }
    }
    print(tickets);
    return "ERROR";
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

  int getIndex() {
    if (filtered == null || tickets == null){
      return 0;
    }else{
      return tickets.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    if(widget.clickedServices.isEmpty) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Your Selected Services"),
        ),
        body:
        new Text("Please Choose a Service!",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat')),
      );
    }else {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Your Selected Services"),
        ),
        body: ListView.builder(
          itemCount: getIndex(),
          itemBuilder: (BuildContext context, int index){
            return new Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Card(
                      child: Container(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Text("Name: "),
                              Text(filtered[index]["name"],
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black87)),
                              Text("Current Ticket: "),
                              Text((filtered[index]["current_ticket"]).toString(),
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.red)),
                              Text("Your Ticket: "),
                              Text((tickets[index]).toString(),
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

}
