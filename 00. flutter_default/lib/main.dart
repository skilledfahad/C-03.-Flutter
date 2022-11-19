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

  MySnakeBar(message,context){

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Project_1"),
        titleSpacing: 5,
        centerTitle: false,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 8,
        backgroundColor: Colors.indigo,
        actions: [ 
          IconButton(onPressed: (){MySnakeBar("comments", context);}, icon: Icon(Icons.comment)),
          IconButton(onPressed: (){MySnakeBar("Book now", context);}, icon: Icon(Icons.add_call)),
          IconButton(onPressed: (){MySnakeBar("24/7 Support", context);}, icon: Icon(Icons.record_voice_over)),
        ],

      )
    );

  }

}

