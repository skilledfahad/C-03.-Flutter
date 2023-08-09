import 'package:flutter/material.dart';

import 'home_screen.dart';


Container roundAvatar(){
  return Container(
    padding: const EdgeInsets.all(5),
    child: ClipOval(
      child: Image.asset(
        "assets/images/img.png",
        fit: BoxFit.cover,
      ),
    ),
  );
}

GridView gridView(){
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisExtent: 100,
      crossAxisCount: 3,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
    ),
    itemCount: 20,
    itemBuilder: (context, index) {
      return Image.asset(
        "assets/images/img.png",
        fit: BoxFit.cover,
      );
    },
  );
}

Container textContents() {
  CrossAxisAlignment crossAxisAlignment = isLandscape? CrossAxisAlignment.start : CrossAxisAlignment.center;

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        tittle("John Doe"),
        const SizedBox(height: 5),
        subTittle("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
      ],
    ),
  );
}

//------- Text Style===reusable------

Text tittle(String text){
  return Text(text,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16));
}

Text subTittle(String text){
  return Text(text);
}