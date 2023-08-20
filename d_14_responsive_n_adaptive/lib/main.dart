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

  @override
  Widget build(BuildContext context) {

    /* * ____ Start _____ * */

    return Scaffold(
        appBar: AppBar(
          title: const Text("Responsive and adaptive"),
        ),
        body: SingleChildScrollView (
          scrollDirection: Axis.vertical,
          child: Column (
            children: [

              Container(
                color: const Color.fromRGBO(182, 250, 175, .5),
                height: 150,
                width: double.infinity,
                alignment: Alignment.center,
                child: AspectRatio(
                  aspectRatio: 16/9,
                  child: Container(
                      color: Colors.greenAccent,
                      child: const Center(child: Text("Aspect Ratio"))),
                ),
              ),

              Container(
                  color: const Color.fromRGBO(250, 176, 175, .5),
                  height: 150,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: FractionallySizedBox(
                    heightFactor: .8,
                    widthFactor: .8,
                    child: Container(color: Colors.pink,child: Center(child: const Text("FractionallySizedBox")),),
                  )
              ),

              Container(
                  color: const Color.fromRGBO(250, 176, 175, .5),
                  height: 150,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: LayoutBuilder(
                    builder: (BuildContext context,BoxConstraints constraints){
                      if(constraints.maxWidth<480){
                        return Container(
                          color: Colors.purple,
                          child: Center(child: Text("Layout Builder,Phone")),
                        );
                      }
                      else if(constraints.maxWidth<768){return Container(
                        color: Colors.orange,
                        child: Center(child: Text("Layout Builder,Tablet")),
                      );}
                      else{return Container(
                        color: Colors.yellowAccent,
                        child: Center(child: Text("Layout Builder,Desktop")),
                      );}

                    },
                  )
              ),


              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                        height: 100,
                        color: Colors.lightBlueAccent,
                        child: Text("Expanded 2")),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        height: 100,
                        color: Colors.redAccent,
                        child: Text("Expanded 1")),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              Row(
                children: [
                  Flexible(
                    fit: FlexFit.loose, // FlexFit.tight = Expanded
                    flex: 2,
                    child: Container(
                        height: 100,
                        color: Colors.lightBlueAccent,
                        child: Text("Flexible 2")),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Container(
                        height: 100,
                        color: Colors.redAccent,
                        child: Text("Flexible 1")),
                  ),
                ],
              )


            ],
          ),
        )
    );
  }
}