import 'package:flutter/material.dart';
import 'style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List my_ToDoList=[];

  late String title;
  late String description;
  late int day;

  grave_title(String value)=> title=value;
  grave_description(String value)=>description=value;
  grave_dayrequired(int value)=>day= value;


  TextEditingController _titelControler = TextEditingController();
  TextEditingController _descriptionControler= TextEditingController();
  TextEditingController _remainingDayControler= TextEditingController();

  list_garaved_data(){
    if(title.isNotEmpty && description.isNotEmpty && day.isFinite){
      my_ToDoList.add({"title":title.trim(),"description":description.trim(),"day":day});
      if(mounted){setState(() {});}

      _titelControler.clear();
      _descriptionControler.clear();
      _remainingDayControler.clear();

      title='';
      description='';
      day=0;

      Navigator.of(context).pop();
    }
  }

  my_taskInput_dialog_fild(context){
   showDialog(context: context,
       builder: (BuildContext context) => AlertDialog(
         title: Text("Add Task"),
         content: Column(
           children: [
             TextFormField(
               keyboardType: TextInputType.text,
               controller: _titelControler,
               onChanged: (value)=>grave_title(value),
               minLines: 1,maxLines: null,decoration: my_input_deco("Title")),
             SizedBox(height: 15),
             TextFormField(
               keyboardType: TextInputType.text,
               onChanged: (value)=>grave_description(value),
               controller: _descriptionControler,
               minLines: 4,maxLines: null,decoration: my_input_deco("Description"),),
             SizedBox(height: 15),
             TextFormField(
                keyboardType: TextInputType.number,
               onChanged: (value) => grave_dayrequired(int.parse(value)),
               controller: _remainingDayControler,
               minLines: 1,maxLines: null,decoration: my_input_deco("Day required"),),
           ],
         ),
         actions: [
           TextButton(
               onPressed: () {
                      list_garaved_data();
                    },
                    child: Text("Save"))
         ],
         scrollable: true,
       )
       );
  }

  GlobalKey<ScaffoldState> _scaffoldkey=GlobalKey<ScaffoldState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Task Manager'),
      ),

      body: ListView.builder(
          itemCount: my_ToDoList.length,
          itemBuilder: (context, index) =>
              GestureDetector(

                onLongPress:
                    (){_scaffoldkey.currentState?.showBottomSheet((context) => Card(
                      color: Colors.white70,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Task Details",style: titel_text(),),
                              const Divider(thickness: 0),
                              Text("Title:  ${my_ToDoList[index]["title"]}"),
                              Text("Description: ${my_ToDoList[index]["description"]}"),
                              Text("Day Required : ${my_ToDoList[index]["day"]}"),
                              ElevatedButton(onPressed: (){
                                my_ToDoList.removeAt(index);
                                setState(() {});
                                Navigator.of(context).pop();
                              }, child: const Text("Delete"))
                            ],),
                        ),
                      ),
                    ))
                ;setState(() {});},

                child: Card(
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(10)),
                    title: Text(my_ToDoList[index]["title"]),
                    subtitle: Text(my_ToDoList[index]["description"]),
                  ),
                ),
              )
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {my_taskInput_dialog_fild(context);},
        child: const Icon(Icons.add),
      ),
    );
  }
}