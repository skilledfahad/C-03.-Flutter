import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Electronics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Electrical"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){Navigator.of(context).pop();},
            child: Text("Back/PoP Button")),
      ),
    );
  }
}