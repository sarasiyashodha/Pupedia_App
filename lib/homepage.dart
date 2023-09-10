import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('Images/dog_image.webp',),
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 30.0),
          padding: EdgeInsets.all(20.0),
          child: TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.black38,
              ),
              hintText: 'Enter a dog breed',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              filled: true,
              fillColor: Colors.white38,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide.none,
              ),

            ),

          ),
        ),
      ),
    );
  }
}
