import 'package:flutter/material.dart';

var device;

var ss_weight;

var ss_hight;

var sm=576;
var	md=768;
var lg=992;
var xl=1200;

 Header_styl(context){

  ss_weight= MediaQuery.of(context).size.width;
  ss_hight= MediaQuery.of(context).size.height;

  if(ss_weight<sm){
    device = "Phone";
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.black);
  }

  else if(ss_weight<md){
    device = "Tablet";
  return const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 28,
      color: Colors.white);
  }

  else if(ss_weight<lg) {
    device = "Big Tablet";
    return const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: Colors.white);
  }

  else if(ss_weight<xl) {
    device = "Laptop";
    return const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: Colors.white);
  }

  else{
    device = "TV";
    return const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: Colors.white);
  }
}