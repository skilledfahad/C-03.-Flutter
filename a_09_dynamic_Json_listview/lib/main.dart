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

  var newData=[
    {"img":"https://i.ebayimg.com/images/g/1wUAAOSwti9kirFR/s-l225.webp", "title":"Tv","subtitle":"LG"},
    {"img":"https://i.ebayimg.com/images/g/1wUAAOSwti9kirFR/s-l225.webp", "title":"Powerbank","subtitle":"Xiaomi"},
    {"img":"https://i.ebayimg.com/images/g/1wUAAOSwti9kirFR/s-l225.webp", "title":"Headphone","subtitle":"Vivo"},
    {"img":"https://i.ebayimg.com/images/g/1wUAAOSwti9kirFR/s-l225.webp", "title":"Phone","subtitle":"Opo"},
    {"img":"https://i.ebayimg.com/images/g/1wUAAOSwti9kirFR/s-l225.webp", "title":"Tv","subtitle":"LG"},
    {"img":"https://i.ebayimg.com/images/g/1wUAAOSwti9kirFR/s-l225.webp", "title":"Powerbank","subtitle":"Xiaomi"},
    {"img":"https://i.ebayimg.com/images/g/1wUAAOSwti9kirFR/s-l225.webp", "title":"Headphone","subtitle":"Vivo"},
    {"img":"https://i.ebayimg.com/images/g/1wUAAOSwti9kirFR/s-l225.webp", "title":"Phone","subtitle":"Opo"},
    {"img":"https://i.ebayimg.com/images/g/1wUAAOSwti9kirFR/s-l225.webp", "title":"Tv","subtitle":"LG"},
    {"img":"https://i.ebayimg.com/images/g/1wUAAOSwti9kirFR/s-l225.webp", "title":"Powerbank","subtitle":"Xiaomi"},
    {"img":"https://i.ebayimg.com/images/g/1wUAAOSwti9kirFR/s-l225.webp", "title":"Headphone","subtitle":"Vivo"},
    {"img":"https://i.ebayimg.com/images/g/1wUAAOSwti9kirFR/s-l225.webp", "title":"Phone","subtitle":"Opo"},
    {"img":"https://i.ebayimg.com/images/g/1wUAAOSwti9kirFR/s-l225.webp", "title":"Tv","subtitle":"LG"},
    {"img":"https://i.ebayimg.com/images/g/1wUAAOSwti9kirFR/s-l225.webp", "title":"Powerbank","subtitle":"Xiaomi"},
    {"img":"https://i.ebayimg.com/images/g/1wUAAOSwti9kirFR/s-l225.webp", "title":"Headphone","subtitle":"Vivo"},
    {"img":"https://i.ebayimg.com/images/g/1wUAAOSwti9kirFR/s-l225.webp", "title":"Phone","subtitle":"Opo"},
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text("Dynamic ListView")),

      /* * ____ Start _____ * */
      body: ListView.builder(
        itemCount: newData.length,
        itemBuilder:(context,index){
          return GestureDetector(
              child: Card(shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Image.network(newData[index]["img"]!),
                title: Text(newData[index]['title']!,style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(newData[index]['subtitle']!),
              )
            )
          );
        }
      )
    );
  }
}