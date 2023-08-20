import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'electronics.dart';

class Automobile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Automobile"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Electronics()));},
          child: Text("Electical"),
        ),
      ),
    );
  }

}