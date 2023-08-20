import 'package:flutter/material.dart';
import 'home.dart';
import 'ac_frezer.dart';
import 'automobile.dart';
import 'childcare.dart';
import 'cooke.dart';
import 'electronics.dart';
import 'housekeeping.dart';
import 'setting.dart';


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

  MySnackbar(context,massage){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massage)));
  }

  /* * ____ Start _____ * */
  TabBar get _tabBar{
    return const TabBar(
      labelColor: Colors.lightBlueAccent,
      unselectedLabelColor: Colors.white,
      isScrollable: true,
      tabs: [
        Tab(icon: Icon(Icons.home), text: "Home",height: 55),
        Tab(icon: Icon(Icons.car_repair), text: "Automobile",height: 55),
        Tab(icon: Icon(Icons.electrical_services), text: "Electrical",height: 55),
        Tab(icon: Icon(Icons.fastfood), text: "Cooke",height: 55),
        Tab(icon: Icon(Icons.cleaning_services), text: "Housekeeping",height: 55),
        Tab(icon: Icon(Icons.severe_cold), text: "AC/Frieze",height: 55),
        Tab(icon: Icon(Icons.child_friendly_outlined), text: "Childcare",height: 55),
        Tab(icon: Icon(Icons.settings), text: "Settings",height: 55),
      ],
    );
  }
  /* * ____ end _____ * */


  @override
  Widget build(BuildContext context) {

    /* * ____ Start _____ * */

    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[300],
          title: Text("Tap Bar"),
          bottomOpacity: 1,
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.blueGrey,
              child: _tabBar,          // To give custom coloring to TabBar we use PreferredSize Widget we can use TabBar directly too
            ),
          )
        ),
        body: TabBarView(
          children: [
            Home(),
            Automobile(),
            Electronics(),
            Cooke(),
            Housekeeping(),
            Ac_frexer(),
            Child_care(),
            Settings(),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {  },
            child: Icon(Icons.message),),
      ));
  }
}