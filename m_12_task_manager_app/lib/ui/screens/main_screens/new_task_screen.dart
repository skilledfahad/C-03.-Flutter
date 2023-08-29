import 'package:flutter/material.dart';
import 'package:m_12_task_manager_app/data/models/network_response_object.dart';
import 'package:m_12_task_manager_app/data/models/summery_count_model.dart';
import 'package:m_12_task_manager_app/data/models/task_list_model.dart';
import 'package:m_12_task_manager_app/data/services/api_caller.dart';
import 'package:m_12_task_manager_app/ui/utils/snack_bar_msg.dart';
import '../../../data/utils/urls.dart';
import '../../widget/summery_card.dart';
import '../../widget/task_list_tile_view.dart';
import 'add_new_task_screen.dart';
import 'update_task_screen.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {_getSummery();
      _getNewTask();
    });
    super.initState();
  }

  bool _isSummeryLoading= false;
  SummeryCountModel _summeryModel = SummeryCountModel();
  Future _getSummery() async {
    if(mounted){
      setState(() {
        _isSummeryLoading=true;
      });
    }
    final NetworkResponse response = await ApiCaller().getRequest(Urls.taskStatusCount);

    if(response.isSuccess){
      _summeryModel = SummeryCountModel.fromJson(response.body!);
    }else{
      if(mounted) {
        SnackBarMsg(context, 'Update failed');
      }
    }
    if(mounted){
      setState(() {
        _isSummeryLoading=false;
      });
    }
  }

  bool _isNewTaskLoading=true;
  TaskListModel _newTaskListModel=TaskListModel();
  Future _getNewTask() async {
    if(mounted){
      setState(() {
        _isNewTaskLoading=true;
      });
    }
    final NetworkResponse response = await ApiCaller().getRequest(Urls.newTaskList);

    if(response.isSuccess){
       _newTaskListModel = TaskListModel.fromJson(response.body!);
    }else{
      if(mounted) {
        SnackBarMsg(context, 'New Task Update failed');
      }
    }
    if(mounted){
      setState(() {
        _isNewTaskLoading=false;
      });
    }
  }

  Future<void> _deleteTask(String taskId) async{
    final NetworkResponse response = await ApiCaller().getRequest(Urls.deleteTask(taskId));
    if(response.isSuccess){
      _newTaskListModel.data!.removeWhere((element) => element.sId==taskId);
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
      floatingActionButton: FloatingActionButton.small(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewTask()));
          },
          child: const Icon(Icons.add)),
      body: Padding(
        padding: const EdgeInsets.only(right: 14,left: 14,top: 5),
        child: Column(
          children: [
            _isSummeryLoading ?
            const LinearProgressIndicator() :
            SizedBox(
              height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemExtent:(MediaQuery.sizeOf(context).width-28)/4,
                    itemBuilder: (context, index) {
                      if (index < (_summeryModel.data?.length ?? 0)) {
                        return SummeryCard(
                          num: _summeryModel.data![index].sum ?? 0,
                          text: _summeryModel.data![index].sId ?? 'New',
                        );
                      } else {
                        return const SummeryCard(
                          num: 0,
                          text: '_ _',
                        );
                      }
                    },
                  ),
                ),

            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  _getSummery();
                  _getNewTask();
                },
                child: _isNewTaskLoading ?
                const Center(
                  child: CircularProgressIndicator(),
                ) :
                ListView.separated(
                  itemCount: _newTaskListModel.data?.length ?? 0,
                  itemBuilder: (context, index) => TaskListTileView(
                    data: _newTaskListModel.data![index],
                    taskConditionColor: Colors.lightBlue,
                    deleteTask: () {_deleteTask(_newTaskListModel.data![index].sId!);},
                    editTask: () {
                      showEditBottomSheet(_newTaskListModel.data![index]);
                      },
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 4,
                      color: Colors.transparent,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void showEditBottomSheet(TaskData task){
    showModalBottomSheet(
      isScrollControlled: true,//important for keyboard scroll, part 1/2
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          UpdateTaskScreen(
              task: task,
              onUpdate: () {_getNewTask();}
          )
    );
  }
}