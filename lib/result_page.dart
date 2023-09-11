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
            Positioned(
              top: 320,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("German Shepard",
                        style: TextStyle(
                          fontFamily: 'PT Serif Caption',
                          fontSize: 30.0,

                      ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('10 years',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],

                  ),
                ),

            ),
            ),
          ],
        ),
      ),
    );
  }
}
