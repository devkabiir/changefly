import 'package:flutter/material.dart';

class ChangeflySplashScreen extends StatefulWidget {
  ChangeflySplashScreen({Key key}) : super(key: key);

  @override
  _ChangeflySplashScreenState createState() => _ChangeflySplashScreenState();
}

class _ChangeflySplashScreenState extends State<ChangeflySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Changefly',
            ),
          ],
        ),
      ),
    );
  }
}
