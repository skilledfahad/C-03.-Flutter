import 'package:flutter/material.dart';
import 'automobile.dart';
import 'electronics.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({required this.title});

  @override
  Widget build(BuildContext context) {

    /* * ____ Start _____ * */

    return Scaffold(
      appBar: AppBar(
        title: Text("Tap Bar"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>Automobile()));},
              child: Text("Automobile"),),
            ElevatedButton(
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Electronics()));},
                child: Text("Electrical")),
          ]
        ),
      )
    );
  }
}