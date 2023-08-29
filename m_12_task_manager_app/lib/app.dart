import 'package:flutter/material.dart';
import 'package:m_12_task_manager_app/ui/screens/splash_screen.dart';


class TaskManagerApp extends StatelessWidget{

  static GlobalKey<NavigatorState> globalKey= GlobalKey<NavigatorState>();

  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: TaskManagerApp.globalKey,

      title: "Task Manager App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,

          primarySwatch: Colors.green,

          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal:24, vertical: 8),
            border: OutlineInputBorder(
                borderSide: BorderSide.none
            )
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
          )
        ),

        textTheme: const TextTheme(
          titleLarge: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          letterSpacing:0.6
        )
        ),

      ),
      darkTheme: ThemeData.dark(

      ),
      home: const SplashScreen(),

    );
  }
}