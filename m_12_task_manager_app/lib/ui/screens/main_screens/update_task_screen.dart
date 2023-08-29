import 'package:flutter/material.dart';
import 'package:m_12_task_manager_app/data/utils/task_status_types.dart';

import '../../../data/models/network_response_object.dart';
import '../../../data/models/task_list_model.dart';
import '../../../data/services/api_caller.dart';
import '../../../data/utils/urls.dart';
import '../../utils/snack_bar_msg.dart';

class UpdateTaskScreen extends StatefulWidget {

  final TaskData task;
  final VoidCallback onUpdate;

  const UpdateTaskScreen({super.key, required this.task, required this.onUpdate});

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {



  final GlobalKey<FormState> editFormKey= GlobalKey();
  late TextEditingController _taskNameController;
  late TextEditingController _taskDisController;
  late String _taskStatus;

  @override
  void initState() {
    _taskNameController = TextEditingController(text: widget.task.title);
    _taskDisController = TextEditingController(text:widget.task.description);
    _taskStatus = widget.task.status!;
    super.initState();
  }

  Future<void> _updateTask(id, taskStatus) async {
    setState(() {
      _isLoading=true;
    });
    final NetworkResponse response = await ApiCaller().getRequest(Urls.updateTask(id, taskStatus));
    if(response.isSuccess){

      widget.onUpdate();
      if(mounted){
        Navigator.pop(context);
        SnackBarMsg(context, 'Task Successfully Updated');
      }
    }else{
      if(mounted){
        SnackBarMsg(context,"Task Update Failed");
      }
    }
    setState(() {
      if(mounted){setState(() {
        _isLoading=false;
      });}
    });
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom
      ),//important for keyboard scroll, part 2/2
      child: SingleChildScrollView(
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          color: Colors.green[100],
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: editFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Update task",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      IconButton(
                          onPressed: (){Navigator.pop(context);},
                          icon: const Icon(Icons.close,color: Colors.grey))
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Text("Task Status: "),
                      DropdownButton(
                        dropdownColor: Colors.white70,
                        value: _taskStatus,
                        onChanged: (String? newValue) {
                          setState(() {
                            _taskStatus = newValue!;
                          });
                        },
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        items:[
                          TaskStatusTypes().newTaskStatus,
                          TaskStatusTypes().progressTaskStatus,
                          TaskStatusTypes().cancelledTaskStatus,
                          TaskStatusTypes().completedTaskStatus
                        ].map((e) {
                          return DropdownMenuItem(
                              value: e,
                              child: Text(e)
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  TextFormField(
                      readOnly: true,
                      controller: _taskNameController,
                      decoration: const InputDecoration(hintText: "Subject"),
                      validator: (String? value){
                        if(value!.isEmpty){
                          return "Enter Task Subject";
                        }
                        return null;
                      }
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                      readOnly: true,
                      controller: _taskDisController,
                      maxLength: 150,
                      maxLines: 5,
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
                              if(editFormKey.currentState!.validate()){
                                _updateTask(widget.task.sId,_taskStatus);
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
