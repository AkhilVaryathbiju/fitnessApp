import 'dart:async';

import 'package:flutter/material.dart';

class JoggingPage extends StatefulWidget {
  const JoggingPage({super.key});

  @override
  State<JoggingPage> createState() => _JoggingPageState();
}

class _JoggingPageState extends State<JoggingPage> {
int seconds = 0;
bool isRunning = false;
double calorie = 0.0;
double distance = 0.0;
late Timer _timer;

void toggleRun(){
  if(isRunning){
    _timer.cancel();
  }else{
    _timer=Timer.periodic(Duration(seconds: 1), (_){
    setState(() {
        seconds++;
      calorie += 0.14;
      distance += 0.14;
    });
    });
  }
  setState(() {
    isRunning=!isRunning;
  });
}
void resetTimer(){
  if(_timer.isActive) _timer.cancel();
  setState(() {
    calorie=0.0;
    distance=0.0;
    seconds=0;
    isRunning=false;
    
  });
}
String get timeFormatted{
  int min = seconds~/60;
  int sec = seconds%60;
  return '${min.toString().padLeft(2,'0')}:${sec.toString().padLeft(2,'0')}'; 
}

double get speed{
  if(seconds<5||distance<0.5) return 0;
  double hours = seconds/3600.0;
  return distance/hours;
}

@override
void dispose(){
  if(isRunning) _timer.cancel();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Time : $timeFormatted')),
          Center(child: _buildStat('Calories : ${calorie.toStringAsFixed(1)} Kcal')),
          Center(child: _buildStat('Distance : ${distance.toStringAsFixed(2)} Km')),
          Center(child: _buildStat('Speed : ${(speed).toStringAsFixed(1)} Km ')),
          Padding(
            padding: const EdgeInsets.only(left: 190,right: 190,top: 10),
            child: TextButton(onPressed: (){
              toggleRun();
            }, child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Center(child: Text('Run / Stop',style: TextStyle(
                color: Colors.white
              ),)))),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 190,right: 190,top: 10),
            child: TextButton(onPressed: (){
              resetTimer();
            }, child: Container(
              
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Center(child: Text('Reset',style: TextStyle(
                color: Colors.white
              ),)))),
          )
        ],
      ),
    );
  }
}
Widget _buildStat(String values ){
  return Padding(padding: EdgeInsets.all(10),
  child: Column(
    children: [
      Text(values,style: TextStyle(
        color: Colors.black,

      )),
      
    ],
  ),);
}