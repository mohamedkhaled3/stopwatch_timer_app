// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import "dart:async";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StopWatchTimerApp(),
    );
  }
}

class StopWatchTimerApp extends StatefulWidget {
  const StopWatchTimerApp({Key? key}) : super(key: key);

  @override
  State<StopWatchTimerApp> createState() => _StopWatchTimerApp();
}

class _StopWatchTimerApp extends State<StopWatchTimerApp> {
  ///////////////////////////////////////////////////////dart
  Duration duration = Duration(seconds: 0);
  // int NewSecond = duration.inSeconds;  //wrong
  Timer? repeatedFunction; // null safety

  bool isRunning = true;

  starTimer() {
    repeatedFunction = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        int NewSecond = duration.inSeconds + 1;
        duration = Duration(seconds: NewSecond);
      });
    });
  }

  ///////////////////////////////////////////////////////flutter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 22),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      "${duration.inHours.remainder(60).toString().padLeft(2, "0")}",
                      style: TextStyle(
                        fontSize: 77,
                      ),
                    ),
                  ),
                  Text(
                    "Hours ",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                width: 33,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 22),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      "${duration.inMinutes.remainder(60).toString().padLeft(2, "0")}",
                      style: TextStyle(
                        fontSize: 77,
                      ),
                    ),
                  ),
                  Text(
                    "Minutes ",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                width: 33,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 22),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      //  use  remainder(60) bec.  x.remainder(y)= z that z < y always
                      "${duration.inSeconds.remainder(60).toString().padLeft(2, "0")}",
                      style: TextStyle(
                        fontSize: 77,
                      ),
                    ),
                  ),
                  Text(
                    "Seconds ",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 33,
          ),
          (isRunning)
              ? ElevatedButton(
                  onPressed: () {
                    starTimer();
                    isRunning = false;
                    // to return the app run after finish when clicked again
                  },
                  child: Text(
                    "Start Timer ",
                    style: TextStyle(fontSize: 27, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 25, 120, 197)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9))),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // repeatedFunction!.cancel();
                        if (repeatedFunction!.isActive) {
                          setState(() {
                            repeatedFunction!.cancel();
                          });
                        } else {
                          starTimer();
                        }
                        // to return the app run after finish when clicked again
                      },
                      child: Text(
                        (repeatedFunction!.isActive) ? "Stop" : "Resume",
                        style: TextStyle(
                            fontSize: 27,
                            color: Color.fromARGB(236, 155, 38, 38)),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 25, 120, 197)),
                        padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9))),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          repeatedFunction!.cancel();
                          duration = Duration(seconds: 0);
                          isRunning = true;
                        });
                        // to return the app run after finish when clicked again
                      },
                      child: Text(
                        "  Cancel  ",
                        style: TextStyle(
                            fontSize: 27,
                            color: Color.fromARGB(236, 155, 38, 38)),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 25, 120, 197)),
                        padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9))),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
