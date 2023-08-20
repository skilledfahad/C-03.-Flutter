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

  /* * ____ Alart Massage _____ * */

  MyAlertMassage(context, titel_mass, content_mass){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(titel_mass),
            content: Text(content_mass),
            actions: [
              ElevatedButton(onPressed: (){Navigator.of(context).pop();                MySnackbar(context,'Done');}, child: Text("Yes")),
              TextButton(onPressed:(){Navigator.of(context).pop();} , child: Text("No"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text("Button")),

      /* * ____ Alart Massage  use_____ * */

      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Center(
                child:
                ElevatedButton(
                  onPressed: (){MyAlertMassage(context,"Alart","Do you to delete");},
                  child: Text("Click Here"),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10)
                      ))
                  ),
                )),
          ]
      ),
    );
  }
}