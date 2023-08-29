import 'package:flutter/material.dart';
import 'package:m_12_task_manager_app/data/models/task_list_model.dart';

import '../../../data/models/network_response_object.dart';
import '../../../data/services/api_caller.dart';
import '../../../data/utils/urls.dart';
import '../../utils/snack_bar_msg.dart';
import '../../widget/task_list_tile_view.dart';
import 'update_task_screen.dart';

class InProgressScreen extends StatefulWidget {
  const InProgressScreen({Key? key}) : super(key: key);

  @override
  State<InProgressScreen> createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getInProgressTask();
    });
    super.initState();
  }

  bool _isLoading=true;
  TaskListModel _inProgressTaskListModel=TaskListModel();

  Future _getInProgressTask() async {
    if(mounted){
      setState(() {
        _isLoading=true;
      });
    }
    final NetworkResponse response = await ApiCaller().getRequest(Urls.progressTaskList);

    if(response.isSuccess){
      _inProgressTaskListModel = TaskListModel.fromJson(response.body!);
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
      _inProgressTaskListModel.data!.removeWhere((element) => element.sId==taskId);
      if(mounted){
        SnackBarMsg(context,"Deletion Successful");
        setState(() {
        });
      }
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
      ):ListView.separated(
        itemCount: _inProgressTaskListModel.data?.length ?? 0,
        itemBuilder: (context, index) =>
        TaskListTileView( taskConditionColor: Colors.purpleAccent, data: _inProgressTaskListModel.data![index],
          deleteTask: () { _deleteTask(_inProgressTaskListModel.data![index].sId!);},
          editTask: () {
            showEditBottomSheet(_inProgressTaskListModel.data![index]);
          },),
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
              height: 4,color: Colors.transparent);},
      ),
    );
  }

  void showEditBottomSheet(TaskData task){
    showModalBottomSheet(
        isScrollControlled: true,//important for keyboard scroll, part 1/2
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) =>
            UpdateTaskScreen(task: task, onUpdate: () {_getInProgressTask();})
    );
  }

}
