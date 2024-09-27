import 'package:flutter/material.dart';

class SocialAuth extends StatelessWidget {

  String imgLink;

  SocialAuth({super.key, required this.imgLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            //begin: Alignment.topCenter,
            colors: [
              const Color.fromARGB(255, 199, 200, 204),
              const Color.fromARGB(255, 199, 200, 204),
            ]
            )
            ),
            child: Image.network(imgLink),
    );
  }
}
