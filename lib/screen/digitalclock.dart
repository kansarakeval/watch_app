import 'package:flutter/material.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  int hour = 0, minute = 0, second = 0, date = 0, month = 0, year = 0;

  @override
  void initState() {
    super.initState();
    digitalClock();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("DigitalColock"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      value: second/60,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("$date/$month/$year",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.white,
                            child: Align(alignment: Alignment.center,
                              child: Text(
                                "$hour",
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.white,
                            child: Align(alignment: Alignment.center,
                              child: Text(
                                "$minute",
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(child: Image.asset("assets/image/googale.png"),backgroundColor: Colors.white),
                SizedBox(width: 10,),
                CircleAvatar(child: Image.asset("assets/image/facbook.png"),backgroundColor: Colors.white),
                SizedBox(width: 10,),
                CircleAvatar(child: Image.asset("assets/image/tweter.png"),backgroundColor: Colors.white),
              ],
            )
          ],
        ),

      ),
    );
  }

  void digitalClock() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        hour = DateTime.now().hour;
        minute = DateTime.now().minute;
        second = DateTime.now().second;
        date=DateTime.now().day;
        month=DateTime.now().month;
        year=DateTime.now().year;
        digitalClock();
      });
    });
    if(hour>12)
      {
        hour=hour-12;
      }
  }
}
