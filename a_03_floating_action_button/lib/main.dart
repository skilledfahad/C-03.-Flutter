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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  mySnackbar(massage,context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(massage)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Floating Action Button'),),
      floatingActionButton: FloatingActionButton(
        onPressed: () { mySnackbar("Clicked ", context);},
        child: Icon(Icons.add_box),
        elevation: 100,
        backgroundColor: Colors.blue,

      ),
    );
  }
}