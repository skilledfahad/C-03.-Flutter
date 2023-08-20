import 'package:flutter/material.dart';
import 'style.dart';
import 'package:responsive_grid/responsive_grid.dart';

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
        title: const Text("Media Query Responsive Style"),
      ),
      body: SingleChildScrollView(
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
                lg: 2,
                xl: 2,
                md: 4,
                sm: 6,
                xs: 6,
                child:Container(
                  height: ss_hight/3,
                  color: Colors.orange,
                  child: Text("Hello flutter!\n$device $ss_weight ",
                      style: Header_styl(context)),
                ),
            ),

            ResponsiveGridCol(
              lg: 2,
              xl: 2,
              md: 4,
              sm: 6,
              xs: 6,
              child:Container(
                height: ss_hight/3,
                color: Colors.green,
                child: Text("Hello flutter! \n$device $ss_weight ",
                    style: Header_styl(context)),
              ),
            ),

            ResponsiveGridCol(
              lg: 12,
              xl: 12,
              md: 12,
              sm: 12,
              xs: 12,

              child:Container(
                height: ss_hight/2,
                color: Colors.blue,
                child: Text("Hello flutter! \n$device $ss_weight ",
                    style: Header_styl(context)),
              ),
            ),

            ResponsiveGridCol(
              lg: 2,
              xl: 2,
              md: 4,
              sm: 4,
              xs: 4,
              child:Container(
                height: ss_hight/2,
                color: Colors.red,
                child: Text("Hello flutter! \n$device $ss_weight ",
                    style: Header_styl(context)),
              ),
            ),

            ResponsiveGridCol(
              lg: 12,
              xl: 12,
              md: 4,
              sm: 4,
              xs: 4,

              child:Container(
                height: ss_hight/2,
                color: Colors.pink,
                child: Text("Hello flutter! \n$device $ss_weight ",
                    style: Header_styl(context)),
              ),
            ),
            ResponsiveGridCol(
              lg: 12,
              xl: 12,
              md: 4,
              sm: 4,
              xs: 4,

              child:Container(
                height: ss_hight/2,
                color: Colors.blueGrey,
                child: Text("Hello flutter! \n$device $ss_weight ",
                    style: Header_styl(context)),
              ),
            ),

          ],
        ),
      )
    );
  }
}