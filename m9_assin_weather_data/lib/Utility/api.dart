import 'dart:convert';
import 'package:http/http.dart';
import 'location.dart';

late String apiMsg;

getWeatherData() async {

  var position= await determinePosition();

  double lat = ((position.latitude*100).round())/100;
  double lon = ((position.longitude*100).round())/100;

  Uri url =Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=6f53eff0368dfbbc734b3cf9aa1bd5e4");
  Response response = await get(url);
  int resultCode = response.statusCode;
  var resultBody = await jsonDecode(response.body);

  if (resultCode == 200){
    apiMsg = "API Update Successful";
    return resultBody;
  }
  else{
    apiMsg = "API Update Failed! Check your Internet Connection";
    return {};
  }
}