import 'package:flutter/material.dart';

InputDecoration input_deco(String lebel){
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    border: OutlineInputBorder(),
    labelText: lebel
  );
}

ButtonStyle button_deco(){
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.all(23),
    backgroundColor: Colors.green,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4))
    )
  );
}

Container my_Container50(child){
  return Container(
    height: 50,
    width: double.infinity,
    alignment: Alignment.center,
    padding: EdgeInsets.all(8),
    child: child,
  );
}