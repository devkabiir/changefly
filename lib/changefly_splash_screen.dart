import 'package:flutter/material.dart';

class ChangeflyName extends StatefulWidget {
  @override
  _ChangeflyNameState createState() => _ChangeflyNameState();
}

class _ChangeflyNameState extends State<ChangeflyName> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = CurvedAnimation(curve: Curves.linear, parent: animationController)
      ..addListener(() {
        setState(() {});
      });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        child: FadeTransition(
          opacity: animation,
          child: Image.asset('assets/changefly-name.png'),
        ),
      ),
    );
  }
}

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
            ChangeflyName(),
          ],
        ),
      ),
    );
  }
}
