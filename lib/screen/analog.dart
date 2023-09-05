import 'dart:math';

import 'package:flutter/material.dart';

class Analog extends StatefulWidget {
  const Analog({super.key});

  @override
  State<Analog> createState() => _AnalogState();
}

class _AnalogState extends State<Analog> {

  int hour = 0, minute = 0, second = 0;

  @override
  void initState() {
    super.initState();
    analog();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/image/p1.png"),
              Transform.rotate(
                angle: pi/2,
                child: Transform.rotate(
                  angle: second*(pi*2)/60,
                  child: Divider(
                    thickness: 2,
                    color: Colors.black,
                    endIndent: MediaQuery.of(context).size.width*0.50,
                    indent: MediaQuery.of(context).size.width*0.15,
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi/2,
                child: Transform.rotate(
                  angle: minute*(pi*2)/60,
                  child: Divider(
                    thickness: 5,
                    color: Colors.black87,
                    endIndent: MediaQuery.of(context).size.width*0.50,
                    indent: MediaQuery.of(context).size.width*0.20,
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi/2,
                child: Transform.rotate(
                  angle: hour*(pi*2)/12,
                  child: Divider(
                    thickness: 5,
                    color: Colors.brown,
                    endIndent: MediaQuery.of(context).size.width*0.50,
                    indent: MediaQuery.of(context).size.width*0.30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void analog() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        hour = DateTime.now().hour;
        minute = DateTime.now().minute;
        second = DateTime.now().second;

        if (hour > 12) {
          hour = hour - 12;
        }
      });
      analog();
    });
  }
}
