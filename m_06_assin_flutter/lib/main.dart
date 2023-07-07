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
  MyHomePage({super.key, required this.title});
  final String title;

  MySnackbar(context,massage){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massage)));
  }

  Container my_card(context)=> Container(
      height: 90,
      child: TextButton(onPressed: (){MySnackbar(context, "Clicked on photo!");}, child: Stack(
        alignment: Alignment.bottomCenter,
        children: [Image.network("https://media.gettyimages.com/id/164713081/nl/foto/asian-baby-celebrating-his-first-birthday.jpg?s=612x612&w=0&k=20&c=4CsPQvDL_dT1k07b-DuhwE7BAEq3BccpzIRLuF9p99c=",fit: BoxFit.cover,),Text("Caption")],
      )));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text('Welcome to My Photo Gallery!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),),
              ),
            ),

            Padding(padding: EdgeInsets.all(10),
              child:TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'Search',
                ),),),

            Wrap(
              children: [
                my_card(context),
                my_card(context),
                my_card(context),
                my_card(context),
                my_card(context),
                my_card(context),
              ],
            ),

            SizedBox(height: 10,),

            Container(
              height: 200,
              child: ListView(
                children: [
                  ListTile(leading: Image.network('https://media.gettyimages.com/id/164713081/nl/foto/asian-baby-celebrating-his-first-birthday.jpg?s=612x612&w=0&k=20&c=4CsPQvDL_dT1k07b-DuhwE7BAEq3BccpzIRLuF9p99c='),
                      title: Text("Sample Photo 1"),
                      subtitle: Text("Catagory 1")),

                  ListTile(leading: Image.network('https://media.gettyimages.com/id/164713081/nl/foto/asian-baby-celebrating-his-first-birthday.jpg?s=612x612&w=0&k=20&c=4CsPQvDL_dT1k07b-DuhwE7BAEq3BccpzIRLuF9p99c='),
                      title: Text("Sample Photo 2"),
                      subtitle: Text("Catagory 2")),

                  ListTile(leading: Image.network('https://media.gettyimages.com/id/164713081/nl/foto/asian-baby-celebrating-his-first-birthday.jpg?s=612x612&w=0&k=20&c=4CsPQvDL_dT1k07b-DuhwE7BAEq3BccpzIRLuF9p99c='),
                      title: Text("Sample Photo 2"),
                      subtitle: Text("Catagory 2")),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {MySnackbar(context, "Photos Uploaded Successfully!");},child: Icon(Icons.cloud_upload)),
    );
  }
}
