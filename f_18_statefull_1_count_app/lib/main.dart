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

class MyHomePage extends StatefulWidget{
  String title;

  MyHomePage({required this.title});

  @override
  State<StatefulWidget> createState() {
    return MyHomePageUI();
  }
}

class MyHomePageUI extends State<MyHomePage>{

  int count_num=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StatefulWidget"),
      ),
      body: Center(child: Text("Count: $count_num")
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: () {

          setState(() {count_num+=1;}

          );
        },
      ),
    );
  }
}
