import 'package:flutter/material.dart';

class SnackBarMsg{

  final BuildContext context;
  final String msg;

  SnackBarMsg(this.context, this.msg){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}