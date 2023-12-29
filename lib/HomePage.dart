import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stopwatch stopwatch;
  late Timer t;

  void handleStartStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String returnFormattedText() {
    var sec = stopwatch.elapsed.inSeconds;
    var min = stopwatch.elapsed.inMinutes;
    var hrs = stopwatch.elapsed.inHours;

    String second = (sec % 60).toString().padLeft(2, '0');
    String minute = (min % 60).toString().padLeft(2, '0');
    String hour = (hrs % 24).toString().padLeft(2, "0");

    return "$hour:$minute:$second";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    t = Timer.periodic(Duration(microseconds: 50), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2A0100),
        title: Text('STOPWATCH'),
      ),
      backgroundColor: Color(0xff795548),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {
                  handleStartStop();
                },
                padding: EdgeInsets.all(0),
                child: Container(
                  height: 255,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff3D1908),
                    border: Border.all(
                      color: Color(0xffBDBDBD),
                      width: 4,
                    ),
                  ),
                  child: Text(
                    returnFormattedText(),
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 90),
              Card(
                color: Color(0xff2A0100),
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 90),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.history,
                        size: 28,
                        color: Color(0xffFFFFFF),
                      ),
                      SizedBox(width: 11),
                      CupertinoButton(
                        onPressed: () {
                          stopwatch.reset();
                          if (stopwatch.isRunning) {
                            stopwatch.stop();
                          }
                        },
                        padding: EdgeInsets.all(0),
                        child: Text(
                          'Reset to Zero',
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
                width: 190,
                child: Divider(
                  color: Color(0xff2A0100),
                  thickness: 1.2,
                ),
              ),
              SizedBox(height: 98),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.copyright,
                      size: 16,
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                    SizedBox(width: 4,),
                    Text(
                      'gauravkumarjha306@gmail.com',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                    )],
                ),
              )],
          ),
        ),
      ),
    );
  }
}
