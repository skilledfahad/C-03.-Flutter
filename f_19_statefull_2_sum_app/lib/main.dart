import 'package:flutter/material.dart';
import 'style.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page', ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String title;

  MyHomePage({required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double sum = 0;

Map<String,double> inputnums= {"num1":0,"num2":0,"num3":0};


  @override
  Widget build(BuildContext context) {

    getInputnymbers(String numkey,double numvale){
      setState(() {});
      return inputnums.update(numkey, (value) => numvale);
    }
    addoperation(){
      setState(() {});
      return  sum= inputnums["num1"]!+inputnums["num2"]!+inputnums["num3"]!;}

    return Scaffold(
      appBar: AppBar(title: Text("Sum")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Sum : $sum",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(onChanged: (vale){getInputnymbers("num1", double.parse(vale));},
                decoration: TextField_style("First Number")),
          ),

          Padding(padding: const EdgeInsets.all(8),
            child: TextFormField(
                onChanged: (vale){getInputnymbers("num2", double.parse(vale));},
                decoration: TextField_style("Second Number"))
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
                onChanged: (vale){getInputnymbers("num3", double.parse(vale));},
                decoration: TextField_style("Thired Number")),
          ),

          Container(width: double.infinity,padding: EdgeInsets.all(8),
              child: ElevatedButton(
                  onPressed: (){addoperation();},
                  child: Text("Add")))
        ],
      ),

    );
  }
}
