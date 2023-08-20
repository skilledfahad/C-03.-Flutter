import 'package:flutter/material.dart';

InputDecoration TextField_style(String lebel){
  return InputDecoration(
    filled: true,
    fillColor: Colors.white54,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    labelText: lebel,
  );
}