import 'package:m_12_task_manager_app/data/utils/task_status_types.dart';

class Urls{
  Urls._();
   static const String _baseUrl = 'https://task.teamrabbil.com/api/v1';
   static String regUrl = '$_baseUrl/registration';
   static String loginUrl = '$_baseUrl/login';
   static String createTask = '$_baseUrl/createTask';
   static String taskStatusCount = '$_baseUrl/taskStatusCount';
   static String newTaskList='$_baseUrl/listTaskByStatus/${TaskStatusTypes().newTaskStatus}';
   static String progressTaskList='$_baseUrl//listTaskByStatus/${TaskStatusTypes().progressTaskStatus}';
   static String completedTaskList='$_baseUrl/listTaskByStatus/${TaskStatusTypes().completedTaskStatus}';
   static String cancelledTaskList='$_baseUrl/listTaskByStatus/${TaskStatusTypes().cancelledTaskStatus}';
   static String deleteTask(String id)=>'$_baseUrl/deleteTask/$id';
   static String updateTask(String id,String taskStatus)=>'$_baseUrl/updateTaskStatus/$id/$taskStatus';

   static String updateProfile = '$_baseUrl/profileUpdate';

   static String otpVerification(String mail,String otp) => '$_baseUrl/RecoverVerifyOTP/$mail/$otp';
   static String verifyEmail(String mail) => '$_baseUrl/RecoverVerifyEmail/$mail';
   static String recoverResetPass = '$_baseUrl/RecoverResetPass';

}