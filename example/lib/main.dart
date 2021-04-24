import 'package:flutter/material.dart';
import 'package:transition_switcher/dialog_switcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DialogSwitcher',
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sample Usage",
                  style: TextStyle(fontSize: 20),
                ),
                DialogSwitcher(
                  dialogBackgroundColor: Colors.transparent,
                  dialogElevation: 0,
                  frontChild: Container(
                    width: 300,
                    height: 300,
                    color: Colors.amber,
                  ),
                  backChild: Container(
                    width: 300,
                    height: 300,
                    color: Colors.pinkAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
