import 'dart:async';
import 'dart:developer';

import 'package:fitnesshive/yoga.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StartyogaPage extends StatefulWidget {
  final List<Yoga>poses;
  const StartyogaPage({Key? key,required this.poses});

  @override
  State<StartyogaPage> createState() => _StartyogaPageState();
}

class _StartyogaPageState extends State<StartyogaPage> {
  int  currentIndex = 0;
  int timeLeft = 30;
  Timer ? timer;
  bool isStarted = false;
  bool isPausedd = false;

  @override
void initState(){
super.initState();
}

void Pause(){
 setState(() {
    isPausedd=!isPausedd;
 });
}

void StartTimer(){
  timer?.cancel();
  setState(() {
    isStarted = true;
    currentIndex =0;
    timeLeft=30;
  });
  timer=Timer.periodic(Duration(seconds: 1), (Timer t){
    if(!isPausedd){
    setState(() {
      if(timeLeft>0){
        timeLeft--;

      }else{
        if(currentIndex<widget.poses.length-1){
          currentIndex++;
          timeLeft=30;
        }else{
          stopYoga();
        }
      }
    });
    }
  });
}
@override
void dispose(){
  timer?.cancel();
  super.dispose();
}
void stopYoga(){
  timer?.cancel();
  setState(() {
    currentIndex=0;
    timeLeft=30;
    isStarted=false;
    isPausedd=false;
  });
}




  @override
  Widget build(BuildContext context) {
    final pose=widget.poses[currentIndex];
    return Scaffold(
      body: Column(
        children: [
          Lottie.network(pose.AssetUrl),
                    SizedBox(height: 40,),
          Text(pose.Name,style: TextStyle(
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
              stopYoga();
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
            Pause();
          }, icon: Icon(isPausedd? Icons.play_arrow:Icons.pause))
        ],
      ),
    );
  }
}