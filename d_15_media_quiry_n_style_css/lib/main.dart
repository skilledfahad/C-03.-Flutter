import 'package:flutter/material.dart';
import 'style.dart';

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

    Header_styl(context);//Must call the function

    return Scaffold(
      appBar: AppBar(
        title: const Text("Media Query Responsive Style"),
      ),
      body: FractionallySizedBox(
        heightFactor: .6,
        child: Center(
            child: Text("Hello flutter! {$device} ",style: Header_styl(context),)),
      ),
    );
  }
}