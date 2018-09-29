import 'package:flutter/material.dart';

class ChangeflyCube extends StatefulWidget {
  @override
  _ChangeflyCubeState createState() => _ChangeflyCubeState();
}

class _ChangeflyCubeState extends State<ChangeflyCube> with TickerProviderStateMixin {
  AnimationController controllerTop;
  AnimationController controllerLeft;
  AnimationController controllerRight;

  Animation<double> animationTop;
  Animation<double> animationLeft;
  Animation<double> animationRight;

  @override
  void initState() {
    super.initState();
    controllerTop = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    controllerLeft = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    controllerRight = AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    animationTop = CurvedAnimation(curve: Curves.linear, parent: controllerTop)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus s) {
        if (s == AnimationStatus.completed) {
          controllerLeft.forward();
        }
      });

    animationLeft = CurvedAnimation(curve: Curves.linear, parent: controllerLeft)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus s) {
        if (s == AnimationStatus.completed) {
          controllerRight.forward();
        }
      });

    animationRight = CurvedAnimation(curve: Curves.linear, parent: controllerRight)
      ..addListener(() {
        setState(() {});
      });

    controllerTop.forward();
  }

  @override
  void dispose() {
    // This is required to make sure resources are freed
    // when navigating away from a screen or when this
    // widget is no longer in view/destroyed.
    controllerTop.dispose();
    controllerLeft.dispose();
    controllerRight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 64.0, vertical: 0.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: animationTop.value,
            child: Image.asset(
              'assets/changefly-cube-top.png',
              width: animationTop.value * 200.0,
              height: animationTop.value * 200.0,
            ),
          ),
          Opacity(
            opacity: animationLeft.value,
            child: Image.asset(
              'assets/changefly-cube-left.png',
              width: animationLeft.value * 200.0,
              height: animationLeft.value * 200.0,
            ),
          ),
          Opacity(
            opacity: animationRight.value,
            child: Image.asset(
              'assets/changefly-cube-right.png',
              width: animationRight.value * 200.0,
              height: animationRight.value * 200.0,
            ),
          ),
        ],
      ),
    );
  }
}

class ChangeflyName extends StatefulWidget {
  /// Callback to execute once all animations are completed
  final Function onAnimationComplete;
  ChangeflyName({Function onAnimationComplete}) : this.onAnimationComplete = onAnimationComplete;

  @override
  _ChangeflyNameState createState() => _ChangeflyNameState();
}

class _ChangeflyNameState extends State<ChangeflyName> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = CurvedAnimation(curve: Curves.linear, parent: animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus s) {
        // Execute the callback if there is one on animation completion
        if (s == AnimationStatus.completed && widget.onAnimationComplete != null) {
          widget.onAnimationComplete();
        }
      });

    animationController.forward();
  }

  @override
  void dispose() {
    // This is required to make sure resources are freed
    // when navigating away from a screen or when this
    // widget is no longer in view/destroyed.
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'appbar-title',
      child: Opacity(
        key: const Key('changefly-name'),
        opacity: animation.value,
        child: Image.asset('assets/changefly-name.png'),
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
            ChangeflyCube(),
            ChangeflyName(),
          ],
        ),
      ),
    );
  }
}
