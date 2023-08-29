import 'package:flutter/material.dart';
import '../../../data/models/network_response_object.dart';
import '../../../data/services/api_caller.dart';
import '../../../data/utils/urls.dart';
import '../../utils/snack_bar_msg.dart';
import '../../widget/profile_banner.dart';
import '../../widget/screen_background.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({Key? key}) : super(key: key);
  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {

  final GlobalKey<FormState> _formKey= GlobalKey();
  final TextEditingController _taskNameController=TextEditingController();
  final TextEditingController _taskDisController=TextEditingController();
  bool _isLoading=false;

  Future<void> addNewTask() async {
    setState(() {
      _isLoading=true;
    });
    Map<String,dynamic> body= {
      "title": _taskNameController.text.trim(),
      "description": _taskDisController.text.trim(),
      "status":"New"
    };
    final NetworkResponse response = await ApiCaller().postRequest(Urls.createTask, body);

    if(response.isSuccess){
      _taskDisController.clear();
      _taskNameController.clear();
      if(mounted){
        SnackBarMsg(context, 'New Task Added');
      }
    }else{
      if(mounted){
        SnackBarMsg(context,"Task Update Fail");
      }
    }
    setState(() {
      if(mounted){setState(() {
        _isLoading=false;
      });}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const ProfileBanner(),
          actions: [
            IconButton(icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          )],
      ),
      body: ScreenBackground(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 80),
                  Text("Add New Task",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _taskNameController,
                    decoration: const InputDecoration(hintText: "Subject"),
                    validator: (String? value){
                     if(value!.isEmpty){
                       return "Enter Task Subject";
                     }
                     return null;
                    }
                  ),
                  const SizedBox(height: 7),
                  TextFormField(
                    controller: _taskDisController,
                    maxLength: 150,
                    maxLines: 10,
                    decoration: const InputDecoration(hintText: "Description"),
                      validator: (String? value){
                        if(value!.isEmpty){
                          return "Enter Task Subject";
                        }
                        return null;
                      }
                  ),
                  // const SizedBox(height: 12),
                  SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: !_isLoading,
                        replacement: const Center(child: CircularProgressIndicator()),
                        child: ElevatedButton(
                            onPressed: (){
                              if(_formKey.currentState!.validate()){
                                addNewTask();
                              }
                            },
                            child: const Icon(Icons.arrow_circle_right_outlined)),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}