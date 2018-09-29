import 'dart:async';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static String routeName = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // This is the main screen we should'nt be able to go back
      onWillPop: () async => Future.value(false),
      child: Scaffold(
        endDrawer: Drawer(
            child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Item 01'),
            )
          ],
        )),
        appBar: AppBar(
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Hero(
              tag: 'appbar-logo',
              child: Image.asset(
                'assets/changefly-cube.png',
                width: IconTheme.of(context).size,
                height: IconTheme.of(context).size,
              ),
            ),
          ),
          title: Hero(
            tag: 'appbar-title',
            child: Image.asset(
              'assets/changefly-name.png',
              color: Colors.white,
              width: Theme.of(context).textTheme.display4.fontSize,
            ),
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[CircularProgressIndicator()],
        )),
      ),
    );
  }
}
