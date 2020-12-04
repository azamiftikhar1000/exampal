import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class FoccusScreen extends StatefulWidget {
  FoccusScreen({Key key}) : super(key: key);

  @override
  _FoccusScreenState createState() => _FoccusScreenState();
}

class _FoccusScreenState extends State<FoccusScreen> with SingleTickerProviderStateMixin{
  
  int minute;
  int seconds = 0;
  bool started = false;

  Timer countdownMin, countdownSec;

  int startSec = 60;
  AnimationController _animationController;
  // Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromARGB(200, 255, 150, 69), Color.fromARGB(255, 250, 196, 110)])
          ),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SleekCircularSlider(
              min: 0,
              max: 120,
              initialValue: 50,
              appearance: CircularSliderAppearance(
                customColors: CustomSliderColors(
                  hideShadow: false,
                  progressBarColor: Colors.blue,
                  trackColor: Colors.blue[200],
                ),
                customWidths:
                    CustomSliderWidths(trackWidth: 8, progressBarWidth: 20),
                angleRange: 360,
                startAngle: 270,
                size: MediaQuery.of(context).size.width * 0.7,
              ),
              onChange: (value) {
                started
                    ? value = minute.toDouble()
                    : setState(() {
                        minute = (value + 1).floor();
                      });
              },
              innerWidget: (value) {
                return Center(
                  child: Container(
                    child: Text(
                      "$minute:$seconds",
                      style: TextStyle(fontSize: 35.0, color: Colors.blue[800]),
                    ),
                  ),
                );
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: started
                  ? RaisedButton(
                      color: Colors.blue[50],
                      onPressed: () {
                        //  StopTimer
                        _animationController.stop();
                        stopTimer();
                        started = false;
                      },
                      child: Text(
                        "stop",
                        style: TextStyle(color: Colors.blue[900]),
                      ),
                    )
                  : RaisedButton(
                      onPressed: () {
                        timerFn();
                        started = true;
                        _animationController.repeat();
                      },
                      color: Colors.blue[50],
                      child: Text(
                        "Start",
                        style: TextStyle(color: Colors.blue[900]),
                      ),
                    ),
            ),
            Container(
              height: 150.0,
              child: Padding(
                padding: const EdgeInsets.only(top:35.0),
                child: Center(
                  child: RotationTransition(
                    turns: _animationController,
                    child: Image.asset("assets/circleDesign.png"),)
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  void timerFn() {
    int startMin = minute.floor();
    const oneMin = Duration(minutes: 1);
    const oneSec = Duration(seconds: 1);
    countdownMin = Timer.periodic(oneMin, (timer) {
      setState(() {
        if (startMin < 1) {
          countdownMin.cancel();
        } else {
          startMin = startMin - 1;
          // print(startMin);
          minute = startMin;
        }
      });
    });
    countdownSec = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (startMin < 1) {
          countdownSec.cancel();
        } else {
          startSec = startSec - 1;
          seconds = startSec;
          print(startSec);
          if (startSec == 0) {
            startSec = 60;
            // seconds = startSec;
          }
        }
      });
    });
  }

  void stopTimer(){
    countdownMin.cancel();
    countdownSec.cancel();
  }
}
