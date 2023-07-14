String studentGrade(String studentName,int testScore){
  if (testScore >= 0 && testScore <= 100 && studentName!= Null){
    if (testScore >= 90) {
      return "A";
    } else if (testScore >= 80) {
      return "B";
    } else if (testScore >= 70) {
      return "C";
    } else if (testScore >= 60) {
      return "D";
    } else {
      return "F";
    }
  } 
  else {
    return "Invalid Grade";
  }
}

void main() {

  String studentName = "Fahad Hossen";  
  int testScore = 85;

  String grade = studentGrade(studentName, testScore);

  print("$studentName's grade: $grade");


}

