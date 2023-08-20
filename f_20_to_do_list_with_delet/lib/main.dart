import'package:flutter/material.dart';
import 'style.dart';

void main(){runApp(MyApp());}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      color: Colors.grey,
      home: MyHomePage(titel: "To Do list",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String titel;
  MyHomePage({required this.titel});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List todo_list=[];

  late String item;



  final TextEditingController _textFieldController = TextEditingController();

  addtolist(){
    setState(() {
      todo_list.add({'item':item});
      item = ''; // Clear the item variable
    });
    _textFieldController.clear();
  }

  grave_alue(value) {
    setState(() {
      item = value;
    });
  }

  deletitem(index){
    setState(() {
    });
    todo_list.removeAt(index);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To Do List"),),
      body: Padding(
        padding: const EdgeInsets.only(left: 4,right: 4),
        child: Column(
          children: [

            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                        child: TextFormField(
                          controller: _textFieldController,
                          onChanged: (value){grave_alue(value);},
                          decoration: input_deco("List Name"),)),
                    Expanded(
                      flex: 3,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: ElevatedButton(
                            child: Text('Add'),
                            style: button_deco(),
                            onPressed:(){addtolist();}
                          ),
                        )
                    )
                  ],
                )
            ),

            Expanded(
                flex: 90,
                child: ListView.builder(
                    itemCount: todo_list.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: my_Container50(
                          Row(
                            children: [
                              Expanded(
                                  flex: 8,
                                  child: Text(todo_list[index]['item'])),
                              Expanded(
                                flex: 2,
                                child: TextButton(
                                    onPressed: (){deletitem(index);},
                                    child: Icon(Icons.delete) ),
                              )
                            ],
                          )
                        ),
                      );
                    },)
            )
          ],
        ),
      ),

    );
  }
}
