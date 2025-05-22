import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_animations/simple_animations.dart';

class MeditationPage extends StatefulWidget {
  const MeditationPage({super.key});

  @override
  State<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:AnimatedGradient() 
    );
  }
}
class AnimatedGradient extends StatefulWidget{
  @override
  State<AnimatedGradient> createState() => _AnimatedGradientState();
}

class _AnimatedGradientState extends State<AnimatedGradient> {
bool isRunning = false;
int _seconds = 0;
Timer?_timer;
final AudioPlayer _music = AudioPlayer();

@override
void initState(){
  super.initState();
  _AudioPlay();

}
Future<void>_AudioPlay()async{
  await _music.setAsset('assets/images/inner-peace-339640.mp3');
  _music.setLoopMode(LoopMode.one);

}



void startTimer(){
 
  if(isRunning)return;
  isRunning=true;
  _music.play();
  _timer=Timer.periodic(Duration(seconds: 1), (Timer){
    setState(() {
      _seconds++;
    });

  });
}
void stopTimer(){
  _timer?.cancel();
  isRunning=false;
  _music.pause();
}

void rsestTimer(){
  stopTimer();
  _music.seek(Duration.zero);
  setState(() {
    _seconds=0;
  });
}
String FormattedTime(int formatted){
  final minutes = (formatted~/60).toString().padLeft(2,'0');
  final Second = (formatted%60).toString().padLeft(2,'0');
  return '$minutes:$Second';
}

@override
void dispose(){
  _music.dispose();
  _timer?.cancel();
  super.dispose();
}

  @override
  Widget build(BuildContext  context){
    return MirrorAnimationBuilder<double>(
      
      
      builder: (context,value,child){
      return Container(
        child: Center(child: Column(
          children: [
            SizedBox(height: 140,),
            SizedBox(
              height: 300,
              child: Lottie.network('https://lottie.host/256c4a7d-ba75-46de-a607-0e550da03393/L7Q46RRIMb.json',)),
            Text(FormattedTime(_seconds),style: TextStyle(fontSize: 26),),
            SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(onPressed: (){
                  startTimer();
                }, child: Container(
                  padding: EdgeInsets.symmetric(),
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(child: Text('Start')))),
                              TextButton(onPressed: (){
              stopTimer();
            }, child: Container(
              padding: EdgeInsets.symmetric(),
              height: 30,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Center(child: Text('Stop')))) ,
              TextButton(onPressed: (){
              rsestTimer();
            }, child: Container(
              padding: EdgeInsets.symmetric(),
              height: 30,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Center(child: Text('Reset')))) 
              ],
            ) ,
                        
              
                       ],
        ),
        
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.lerp(Colors.deepPurple, const Color.fromARGB(255, 126, 31, 143),value)!,
            Color.lerp(Colors.indigo,Colors.purpleAccent,value)!
          ])
        ),
      );
    }, tween: Tween(begin: 0.0,end: 1.0,), duration: Duration(seconds: 4),
curve: Curves.easeIn,
child: Center(
  child: Lottie.network(''),
),

    );
  }
}