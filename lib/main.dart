import 'package:flutter/material.dart';
import 'home_screen.dart';

void main()=>runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Responsive App",
      theme: ThemeData(
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
        ))),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }
}



