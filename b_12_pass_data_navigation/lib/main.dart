import 'package:flutter/material.dart';


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

  MySnackbar(context,massage){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massage)));
  }

  @override
  Widget build(BuildContext context) {

    /* * ____ Start _____ * */

    return Scaffold(
        appBar: AppBar(
          title: Text("Tap Bar"),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LinearProgressIndicator(
                  color: Colors.lightBlue,
                  backgroundColor: Colors.white,
                  minHeight: 6,
                ),

                CircularProgressIndicator(
                  color: Colors.lightGreenAccent,
                  backgroundColor: Colors.grey,
                  strokeWidth: 5,
                ),

                Text("Demo Text"),
                Text("Demo Text"),
                Text("Demo Text"),

              ]
          ),
        )
    );
  }
}