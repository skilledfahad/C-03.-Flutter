import 'package:flutter/material.dart';

SizedBox sizedBox5(){
  return SizedBox(height: 5);
}

SizedBox loadingView(double? gap,String msg) {
  return SizedBox(
    height: 100,
    child: Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          sizedBox5(),
          const CircularProgressIndicator(),
          SizedBox(height: gap),
          Text(msg),
        ],
      ),
    ),
  );
}