import 'package:flutter/material.dart';
import 'cart.dart';

int total_count=0;

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
      home: ProductList(title: 'Flutter Demo Home Page', ),
    );
  }
}

class ProductList extends StatefulWidget {
  
  String title;

  ProductList({required this.title});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  List<Map<String, dynamic>> products = [
    {
      "name": "Product 1",
      "price": 69,
      "count": 0,
    },
    {
      "name": "Product 2",
      "price": 23,
      "count": 0,
    },
    {
      "name": "Product 3",
      "price": 94,
      "count": 0,
    },
    {
      "name": "Product 4",
      "price": 53,
      "count": 0,
    },
    {
      "name": "Product 5",
      "price": 11,
      "count": 0,
    },
    {
      "name": "Product 6",
      "price": 47,
      "count": 0,
    },
    {
      "name": "Product 7",
      "price": 86,
      "count": 0,
    },
    {
      "name": "Product 8",
      "price": 31,
      "count": 0,
    },
    {
      "name": "Product 9",
      "price": 75,
      "count": 0,
    },
    {
      "name": "Product 10",
      "price": 59,
      "count": 0,
    },
    {
      "name": "Product 11",
      "price": 38,
      "count": 0,
    },
    {
      "name": "Product 12",
      "price": 28,
      "count": 0,
    },
    {
      "name": "Product 13",
      "price": 82,
      "count": 0,
    },
    {
      "name": "Product 14",
      "price": 17,
      "count": 0,
    },
    {
      "name": "Product 15",
      "price": 42,
      "count": 0,
    },
  ];

  MyAlertMassage(context, titel_mass, content_mass){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(titel_mass),
            content: Text(content_mass),
            actions: [
              ElevatedButton(child: Text("Ok"),onPressed: (){Navigator.of(context).pop();})
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
        body: ListView.builder(
            itemCount: products.length,
            itemBuilder:(context,index){
              return GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.only(left: 4,top: 5,bottom: 0,right: 4),
                        child: ListTile(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          leading: Icon(Icons.photo,size: 50),
                          title: Text("${products[index]['name']}"),
                          subtitle: Text('Price : "${products[index]['price']}"'),
                          trailing: ElevatedButton(onPressed: ()
                            {
                              //task 1 ----- Total Count
                              total_count+=1;
                              print("$total_count");
                              //task 2 ----- Individual count and massage
                              products[index]['count']=(products[index]['count'])+1;
                              if ((products[index]['count'])==5)
                                {
                                  MyAlertMassage(context, "Congratulation!", "You've bought 5 ${products[index]['name']}");
                                  // Task 3 ----- Task 2 reuse
                                  products[index]['count']=0;
                                }
                            },
                            child: Text("Buy Now"),),
                          tileColor: Colors.grey,
                        ),
                      )
              );
            }
        ),
        floatingActionButton: FloatingActionButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (_)=>Cart())); },
        child: Icon(Icons.shopping_cart)),
    );
  }
}
