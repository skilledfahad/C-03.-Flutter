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
  final String title;
  MyHomePage({required this.title});

  MySnackbar(context,massage){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massage)));
  }



  @override
  Widget build(BuildContext context) {

    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.red,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomRight: Radius.circular(5),)
        )
    );

    return Scaffold(
      appBar: AppBar(title: Text("Button")),

      /*____ Drawer _____ */
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            TextButton(onPressed:(){MySnackbar("clicked",context);}, child:Text("Text button"),),
            Center(child: ElevatedButton(onPressed: (){MySnackbar("clicked",context);}, child: Text("Elebated button"),style: buttonStyle)),
            OutlinedButton(onPressed: (){MySnackbar("clicked",context);}, child: Text("Outloine button"))
          ]

      ),

    );
  }
}