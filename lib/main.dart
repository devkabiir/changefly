import 'package:changefly/changefly_splash_screen.dart';
import 'package:changefly/main_screen.dart';

import 'package:flutter/material.dart';

void main() => runApp(ChangeflyApp());

class ChangeflyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        MainScreen.routeName: (context) => MainScreen(),
      },
      title: 'Changefly Animation Demo',
      home: SafeArea(child: ChangeflySplashScreen()),
    );
  }
}
