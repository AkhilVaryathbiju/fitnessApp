import 'package:fitnesshive/bottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingFitness extends StatefulWidget {
  const OnboardingFitness({super.key});

  @override
  State<OnboardingFitness> createState() => _OnboardingFitnessState();
}

class _OnboardingFitnessState extends State<OnboardingFitness> {
  @override
  Widget build(BuildContext context) {
    PageDecoration _pageDecor = PageDecoration(
      
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26
      ),
      bodyTextStyle: TextStyle(
        fontSize: 15
      ),
      imagePadding: EdgeInsets.only(top: 50),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(colors: [
        Colors.white,
        Colors.white
        ])
      )
    );
    return IntroductionScreen(
      
      pages: [
        PageViewModel(
          decoration: _pageDecor,
          title: 'Welcome to fitJourney',
          body: 'Your journey to a healthier, stronger you starts here Track your workouts, meals, and progress — all in one place.'
,
          image: Align(
            alignment: Alignment.center,
            child: Image.asset('assets/images/workoutwelcome.jpg'),
          )
          
        ),
             PageViewModel(
          decoration: _pageDecor,
          title: 'Workout Anywhere',
          body: 'Train anytime, anywhere — at home, in the park, or on the go.'
,
          image: Align(
            alignment: Alignment.center,
            child: Image.asset('assets/images/workoutAnywhere.jpg'),
          )
          
        ),
             PageViewModel(
          decoration: _pageDecor,
          title: 'Meditate',
          body: 'Breathe,Relax and release stress with guided meditaion'
,
          image: Align(
            alignment: Alignment.center,
            child: Image.asset('assets/images/meditate.jpg'),
          )
          
        )

      ],
      globalBackgroundColor: Colors.white,
      dotsDecorator: DotsDecorator(
        color: Colors.blue,
        activeColor: Colors.lightBlueAccent,
        size: Size(5, 5),
        activeSize: Size(10, 10)
      ),
      showSkipButton: true,
      next: Container(
        height: 30,
        child: Center(
          
          child: Text('Next',style: TextStyle(color: Colors.white),),),
        decoration: BoxDecoration(
color: Colors.blue,
borderRadius: BorderRadius.circular(10)
      ),),
      onDone: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomnavigationPage()));
      },
      onSkip: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomnavigationPage()));
      },
      skip: Container(
        height: 30,
        child: Center(child: Text('Skip',style: TextStyle(color: Colors.black),),),
        decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(10)
      ),),
      done: Container(
        height: 30,
        child: Center(
          
          child: Text('Done',style: TextStyle(color: Colors.white),),),
        decoration: BoxDecoration(
color: Colors.blue,
borderRadius: BorderRadius.circular(10)
      ),),
      
    );
  }
}