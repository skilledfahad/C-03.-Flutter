import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Bottom nav bar")),

        /*____ Drawer _____ */
        endDrawer: Drawer(),

        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  padding: EdgeInsets.all(0),
                  child:
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.red[400]),
                    accountEmail: Text("skilledfahad@gmail.com"),
                    accountName: Text("Fahad"),
                    currentAccountPicture: Image.asset("image/fahad.png"),
                  )
              ),

              ListTile(leading: Icon(Icons.home_rounded),
                title: Text("Home"),
                subtitle: Text("Subtitel"),
                onTap: (){MySnackbar(context,"Clicked");},
              ),
              ListTile(leading: Icon(Icons.menu_book_outlined),
                title: Text("Book"),
                onTap: (){MySnackbar(context,"Clicked");},
              ),
              ListTile(title: Text("Profile"),),
              ListTile(title: Text("Support"),)
            ],
          ),
        )
    );
  }
}