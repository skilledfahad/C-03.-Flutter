import 'package:flutter/material.dart';

InputDecoration my_input_deco(String lebel){
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    border: OutlineInputBorder(),
    labelText: lebel,
  );
}

TextStyle titel_text(){
  return TextStyle(
    fontWeight: FontWeight.bold,
  );
}