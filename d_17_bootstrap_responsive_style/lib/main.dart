import 'package:flutter/material.dart';
import 'style.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

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


  @override
  Widget build(BuildContext context) {

    Header_styl(context);


    /* * ____ Start _____ * */

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bootstrap Responsive Style"),
      ),
      body:
      BootstrapContainer(
        fluid: false,
        children: [

             BootstrapRow(


                 children: [
                   BootstrapCol(
                 sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                 child: Container(
                   height: ss_hight/3,
                   color: Colors.green,)),
                   BootstrapCol(
                     sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                     child: Container(
                       height: ss_hight/3,
                       color: Colors.red,),
                   ),
                   BootstrapCol(
                     sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                     child: Container(
                       height: ss_hight/3,
                       color: Colors.blue,),
                   ),
                   BootstrapCol(
                       sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                       child: Container(
                         height: ss_hight/3,
                         color: Colors.green,)),
                   BootstrapCol(
                     sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                     child: Container(
                       height: ss_hight/3,
                       color: Colors.red,),
                   ),
                   BootstrapCol(
                     sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                     child: Container(
                       height: ss_hight/3,
                       color: Colors.blue,),
                   ),BootstrapCol(
                       sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                       child: Container(
                         height: ss_hight/3,
                         color: Colors.green,)),
                   BootstrapCol(
                     sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                     child: Container(
                       height: ss_hight/3,
                       color: Colors.red,),
                   ),
                   BootstrapCol(
                     sizes: 'col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6',
                     child: Container(
                       height: ss_hight/3,
                       color: Colors.blue,),
                   ),



             ])

           ],
      )
      );
  }
}