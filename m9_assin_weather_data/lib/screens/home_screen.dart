import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Utility/api.dart';
import '../Utility/location.dart';
import '../Utility/time_date.dart';
import '../style.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late Map weatherData;
  late String iconCode, sunriseTime, sunsetTime,time=
  '0';
  late double currentTempInC,feelsLike,windSpeed,humidity,pressure;
  late bool loading;

  @override
  void initState() {
      callWeatherData();
      Timer.periodic(const Duration(seconds: 1),(Timer t)=>timeGet());
      super.initState();
  }

  callWeatherData() async {
    setState(() {
      loading=true;
    });
    
    var data = await getWeatherData();
    setState(() {
      weatherData = data;
      iconCode = weatherData["weather"][0]["icon"];
      currentTempInC = weatherData["main"]["temp"]-273.15;
      feelsLike = weatherData["main"]["feels_like"]-273.15;
      humidity = weatherData["main"]["humidity"];
      pressure = weatherData["main"]["pressure"];
      windSpeed = weatherData["wind"]["speed"];

      //sunRise and Set
      //get Api UnixTime
      int sunriseUnix = weatherData["sys"]["sunrise"];
      int sunsetUnix = weatherData["sys"]["sunset"];
      //convert to 24H time format
      DateTime sunriseDateTime = DateTime.fromMillisecondsSinceEpoch(sunriseUnix * 1000);
      DateTime sunsetDateTime = DateTime.fromMillisecondsSinceEpoch(sunsetUnix * 1000);
      //convert it to 12h format
      sunriseTime = DateFormat('h:mm a').format(sunriseDateTime);
      sunsetTime = DateFormat('h:mm a').format(sunsetDateTime);
      
      loading=false;

      mySnackBar(context, locationMsg);
      mySnackBar(context, apiMsg);
    });
  }

  timeGet(){
    setState(() {
      getTime();
      time=timeString;
    });
  }

  mySnackBar(context, String msg){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Current Weather"),
      ),
      body:
      Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue,Colors.white],
          ),
        ),
        child:loading? ((loadingView(10,"Gps Loading..."))):
        (SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //====== Country Name ======
              Text("${weatherData["name"]}, ${weatherData["sys"]["country"]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              sizedBox5(),

              //====== Time ======

              Text (time),

              sizedBox5(),

              //====== Icon Row Card 1 ======
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 90,
                    child: Card(
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                      child: Column(
                          children:[
                            Image.network("https://openweathermap.org/img/wn/$iconCode.png"),
                            //----Update Under Icon----
                            Text(weatherData["weather"][0]["main"])
                      ]),
                    ),
                  ),

                  //------ Temperature ------
                  Column(
                    children: [
                      Text(
                        "${currentTempInC.toStringAsFixed(1)}\u{00B0}C",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(" Feels Like: ${feelsLike.toStringAsFixed(1)}\u{00B0}C ")
                    ],
                  ),

                  //-----card 2 max-min temp
                  SizedBox(
                    height: 90,
                    child: Card(
                      color: Color.fromRGBO(0, 0, 0, 0.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Wind: $windSpeed km/h"),
                              Text("Humidity: $humidity%"),
                              Text("Pressure: $pressure hPa"),
                            ],
                          ),
                        )),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("$date, ${weekDay()}"),
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.sunny_snowing,color: Colors.orangeAccent,),
                  Text("Sunrise:$sunriseTime  ||  Sunset:$sunsetTime",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Icon(Icons.sunny_snowing,color: Colors.redAccent),

                ],
              ),

            ],
          ),
        )),
      ),
    );
  }
}
