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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Your selected Services"),
      ),
      body: new Text("${widget.clickedServices}"),
    );
  }

}
