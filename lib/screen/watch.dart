import 'package:flutter/material.dart';

class Watch extends StatefulWidget {
  const Watch({super.key});

  @override
  State<Watch> createState() => _WatchState();
}

class _WatchState extends State<Watch> {

  int hour = 0, minute = 0, second = 0, date = 0, month = 0, year = 0, day = 0;

  @override
  void initState() {
    super.initState();
    watch();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("ui"),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 185,
                width: 185,
                child: Container(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value: second/60,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              SizedBox(
                height: 193,
                width: 193,
                child: Container(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value: minute/60,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: Container(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value: hour/12,
                    color: Colors.red,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$day",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Text("$date/$month/$year",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text("$hour : $minute : $second",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(height: 10),
                  Text("PM    33",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void watch()
  {
    Future.delayed(Duration(seconds:1),(){
      setState(() {
        hour=DateTime.now().hour;
        minute=DateTime.now().minute;
        second=DateTime.now().second;
        date=DateTime.now().day;
        month=DateTime.now().month;
        year=DateTime.now().year;
        day=DateTime.now().weekday;
        watch();
      });
    },
    );
    if(hour>12)
    {
      hour=hour-12;
    }
  }
}
