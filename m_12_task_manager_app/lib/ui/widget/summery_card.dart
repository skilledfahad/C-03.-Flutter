import 'package:flutter/material.dart';

class SummeryCard extends StatelessWidget {
  const SummeryCard({
    super.key,
    required this.num,
    required this.text,
  });

  final int num;
  final String text;

  @override
  Widget build(BuildContext context) {

    String numPadeLeft = num<10 ? num.toString().padLeft(2,'0'):num.toString();

    return SizedBox(
      height: 70,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 8,bottom: 8,left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(numPadeLeft,style: Theme.of(context).textTheme.titleLarge),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}