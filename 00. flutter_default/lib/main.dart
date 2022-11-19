import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData(primarySwatch: Colors.grey),
      color: Colors.yellowAccent,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Project_1"),
        titleSpacing: 0,
        centerTitle: false,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 10,
        backgroundColor: Colors.indigo,
        actions: [ on

        ],

      )
    );

  }

}
