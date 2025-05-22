import 'dart:async';

import 'package:fitnesshive/model/userModel.dart';
import 'package:fitnesshive/workout.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';




class StartworkoutPage extends StatefulWidget {
 final List<exercise>workouts;
 const  StartworkoutPage({ Key?key, required this.workouts});

  @override
  State<StartworkoutPage> createState() => _StartworkoutPageState();
}

class _StartworkoutPageState extends State<StartworkoutPage> {

  int currentIndex = 0;
  int timeLeft = 30;
bool isPaused=false;
   Timer ? timer;
bool started =false;
@override
void initState(){
  super.initState();

}
void StartTimer(){
  timer?.cancel();
setState(() {
  started=true;
  currentIndex=0;
  timeLeft=30;
  isPaused=false;
});

  timer=Timer.periodic(Duration(seconds: 1), ( Timer t){
      if (!isPaused) {
        setState(() {
          if (timeLeft > 0) {
            timeLeft--;
          } else {
            if (currentIndex < widget.workouts.length - 1) {
              currentIndex++;
              timeLeft = 30;
            } else {
            stopWorkout();
            }
          }
        });
      }
    });
  }

void pause(){
  setState(() {
    isPaused=!isPaused;
  });
}

@override
void dispose(){
  timer?.cancel();
  super.dispose();
}
void stopWorkout(){
  timer?.cancel();
  setState(() {
    started=false;
    isPaused=false;
    timeLeft=30;
    currentIndex=0;
  });
}

  @override
  Widget build(BuildContext context) {
    final workoutt=widget.workouts[currentIndex];
    return  Scaffold(
      body: Column(
        children: [
          Lottie.network(workoutt.lottieUrl),
          SizedBox(height: 40,),
          Text(workoutt.name,style: TextStyle(
            fontSize: 18
          ),),
          Text('$timeLeft',style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 23),),
         Row(mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             TextButton(onPressed: (){
              StartTimer();
             }, child: Container(
              width: 80,
              height: 30,
              child: Center(child: Text('Start',style: TextStyle(
                color: Colors.white
              ),)),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20)
              ),
             )),
             SizedBox(width: 2,),
             TextButton(onPressed: (){
              stopWorkout();
             }, child: Container(
              width: 80,
              height: 30,
              child: Center(child: Text('Stop',style: TextStyle(
                color: Colors.white
              ),)),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20)
              ),
             )),
           ],
         ),
          IconButton(onPressed: (){
            pause();
          }, icon: Icon(isPaused? Icons.play_arrow:Icons.pause))
        ],
      ),
    );
  }
}