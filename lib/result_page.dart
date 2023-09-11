import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("Images/german_shepherd.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            ),
            // Positioned(child: child)
          ],
        ),
      ),
    );
  }
}
