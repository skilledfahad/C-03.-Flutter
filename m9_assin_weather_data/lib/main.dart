import 'package:flutter/material.dart';
import 'Screens/home_screen.dart';

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      theme: ThemeData(textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize:16,fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontWeight: FontWeight.w600))
      ),
      home: const MyHomePage()
    );
  }
}
