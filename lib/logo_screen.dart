import 'package:flutter/material.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image(image: AssetImage('Images/dog_logo.png'),
          ),
          Text("Pupedia",
            style: TextStyle(
              fontFamily: 'BubblegumSans',
              fontSize: 60.0,
          ),
          ),
        ],
      ),
    );
  }
}
