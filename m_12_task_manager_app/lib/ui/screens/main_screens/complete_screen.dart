import 'package:flutter/material.dart';

import '../../../data/models/network_response_object.dart';
import '../../../data/models/task_list_model.dart';
import '../../../data/services/api_caller.dart';
import '../../../data/utils/urls.dart';
import '../../utils/snack_bar_msg.dart';
import '../../widget/task_list_tile_view.dart';
import 'update_task_screen.dart';

class CompleteTaskScreen extends StatefulWidget {
  const CompleteTaskScreen({Key? key}) : super(key: key);

  @override
  State<CompleteTaskScreen> createState() => _CompleteTaskScreenState();
}

class _CompleteTaskScreenState extends State<CompleteTaskScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCompletedTask();
    });
    super.initState();
  }

  TaskListModel _completeTaskListModel = TaskListModel();
  bool _isLoading=true;
  Future _getCompletedTask() async {
    if(mounted){
      setState(() {
        _isLoading=true;
      });
    }
    final NetworkResponse response = await ApiCaller().getRequest(Urls.completedTaskList);

    if(response.isSuccess){
      _completeTaskListModel = TaskListModel.fromJson(response.body!);
    }else{
      if(mounted) {
        SnackBarMsg(context, 'New Task Update failed');
      }
    }
    if(mounted){
      setState(() {
        _isLoading=false;
      });
    }
  }

  Future<void> _deleteTask(String taskId) async{
    final NetworkResponse response = await ApiCaller().getRequest(Urls.deleteTask(taskId));
    if(response.isSuccess){
      _completeTaskListModel.data!.removeWhere((element) => element.sId==taskId);
      if(mounted){
        SnackBarMsg(context,"Deletion Successful");
        setState(() {
        });
      };
    }else{
      if (mounted) {
        SnackBarMsg(context,"Deletion Unsuccessful");
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_isLoading? const Center(
        child: CircularProgressIndicator(),
      ): ListView.separated(
        itemCount: _completeTaskListModel.data?.length ?? 0,
        itemBuilder: (context, index) =>
        TaskListTileView( taskConditionColor: Colors.green, data: _completeTaskListModel.data![index],
          deleteTask: () {_deleteTask(_completeTaskListModel.data![index].sId!);},
          editTask: () {
            showEditBottomSheet(_completeTaskListModel.data![index]);
          },),
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
              height: 4,color: Color.fromRGBO(0, 0, 0, 0));},
      ),
    );
  }

  void showEditBottomSheet(TaskData task){
    showModalBottomSheet(
        isScrollControlled: true,//important for keyboard scroll, part 1/2
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) =>
            UpdateTaskScreen(task: task, onUpdate: () {
              _getCompletedTask();
            })
    );
  }

}