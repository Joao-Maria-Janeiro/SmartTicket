import 'package:flutter/material.dart';
import './pages/available_services.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(url:"https://smartticket-lojadocidadao.herokuapp.com/"),
    );
  }
}



