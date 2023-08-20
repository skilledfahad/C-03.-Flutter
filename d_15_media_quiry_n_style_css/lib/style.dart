import 'package:flutter/material.dart';
String device="";

TextStyle Header_styl(context){

  var ss_weight= MediaQuery.of(context).size.width;


  if(ss_weight<700){
    device = "Phone";
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.black
    );
  }
  else{
    device = "Desktop";
    return const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: Colors.green
    );
  }
}