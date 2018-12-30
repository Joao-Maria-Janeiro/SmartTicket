import 'package:flutter/material.dart';


class ServicePage extends StatefulWidget {

  final  Set<String> clickedServices;

  const ServicePage({Key key, this.clickedServices}) : super(key: key);

  @override
  State createState() => new ServicePageState();
}

class ServicePageState extends State<ServicePage> {
  Set<String> clickedServices;



  @override
  Widget build(BuildContext context) {
    if(widget.clickedServices.isEmpty) {
      return new Scaffold(
          backgroundColor: new Color.fromRGBO(240, 240, 240, 4),
        appBar: new AppBar(
          title: new Text("Your Selected Services"),
        ),
        body: new Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          height: 50.0,
          child: new Text("Please Choose a Service!",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat')),
        )
      );
    }else {
      return new Scaffold(
          backgroundColor: new Color.fromRGBO(240, 240, 240, 4),
        appBar: new AppBar(
          title: new Text("Your Selected Services"),
        ),
          body: new Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            height: 50.0,
            child: new Text("${widget.clickedServices}",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat')),
          )
      );
    }
  }

}
