import 'package:flutter/material.dart';
import 'package:watch/screen/analog.dart';
import 'package:watch/screen/digitalclock.dart';
import 'package:watch/screen/watch.dart';

void main() {
  runApp(
    MaterialApp(
      // routes: {
      //   '/': (context) => Watch(),
      // },
       home: DigitalClock(),
      debugShowCheckedModeBanner: false,
    ),
  );
}