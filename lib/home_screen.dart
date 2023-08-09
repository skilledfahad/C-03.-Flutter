import 'package:flutter/material.dart';
import 'content.dart';

late bool isLandscape;


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Responsive App"),
        ),

        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            if(orientation == Orientation.portrait){
              isLandscape=false;
              return const PortraitMode();
            }
            else{
              isLandscape=true;
              return const Landscape();
            }
          },)
    );
  }
}

class PortraitMode extends StatelessWidget {
  const PortraitMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: roundAvatar(),
        ),
        textContents(),
        Flexible(
          child: gridView(),
        ),
      ],
    );
  }
}

class Landscape extends StatelessWidget {
  const Landscape({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: roundAvatar(),
        ),
        Expanded(
          child: Column(
            children: [
              textContents(),
              Flexible(child: gridView())
            ]
          ),
        )
      ]
    );
  }
}

