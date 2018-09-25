import 'package:changefly/ChangeflySpashScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(ChangeflyApp());

class ChangeflyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Changefly Animation Demo',
      home: ChangeflySplashScreen(),
    );
  }
}
