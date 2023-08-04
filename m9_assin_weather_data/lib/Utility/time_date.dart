import 'package:intl/intl.dart';

late String timeString;

void getTime() {
  DateTime currentDateTime = DateTime.now();
  timeString = DateFormat("h:mm:ss a").format(currentDateTime);
}

DateTime _currentDateTime = DateTime.now();
String date = "${_currentDateTime.day} - ${_currentDateTime.month} - ${_currentDateTime.year}";

int dayOfWeek = _currentDateTime.weekday;

String weekDay(){
  if(dayOfWeek==1){
    return "Monday";
  }
  else if(dayOfWeek==2){
    return "Tuesday";
  }
  else if(dayOfWeek==3){
    return  "Wednesday";
  }
  else if(dayOfWeek==4){
    return "Thursday";
  }
  else if(dayOfWeek==5){
    return  "Friday";
  }
  else if(dayOfWeek==6){
    return  "Saturday";
  }
  else{
    return  "Monday";
  }
}