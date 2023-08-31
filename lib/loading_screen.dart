import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('Images/dog_logo.png'),
              width: 250.0,
            ),
            Text("Pupedia",
              style: TextStyle(
                fontFamily: 'Bubblegum Sans',
                fontSize: 60.0,
            ),
            ),
            SpinKitCircle(
              color: Colors.grey,
              size: 60.0,
            ),
          ],
        ),
      ),
    );
  }
}