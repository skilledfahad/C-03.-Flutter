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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""),
          backgroundColor: Colors.blue),
      body: Column(children: [

        Expanded(
            flex: 5,
            child:
            Container(
                alignment: Alignment.center,
                width: double.infinity,                    // Very importent
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    border: Border.all(width: 0),
                    borderRadius: BorderRadius.circular(10)),
                child: Text("Simple column 50%",style: TextStyle(fontWeight: FontWeight.bold))
            )),

        Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.only(top:5,bottom:5),
                      decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                    )),
                Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.pink,
                      child: Image.network('https://pbs.twimg.com/media/Ft6yRdQWwAA5o3e?format=jpg&name=large',
                          fit: BoxFit.cover),
                    ))
              ],
            )),

        Expanded(
            flex: 2,
            child: Container(
                alignment: Alignment.topCenter,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.orange),
                child: Text("Simple column 20%",style: TextStyle(fontWeight: FontWeight.bold),)
            ))

      ]),
    );
  }
}

