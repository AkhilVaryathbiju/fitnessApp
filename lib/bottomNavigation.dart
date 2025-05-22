import 'package:fitnesshive/FitnessHome.dart';
import 'package:fitnesshive/Meditation.dart';
import 'package:fitnesshive/accountPage.dart';
import 'package:fitnesshive/model/dietpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomnavigationPage extends StatefulWidget {
  const BottomnavigationPage({super.key});

  @override
  State<BottomnavigationPage> createState() => _BottomnavigationPageState();
}

class _BottomnavigationPageState extends State<BottomnavigationPage> {
  
  int index=0; 
  var pages=[
    FitnesshomePage(),
    MeditationPage(),
    myAccount()
  ];

Color getColor(){

  switch(index){
    case 0:
      return Colors.white;
    case 1:
    return Colors.deepPurple;
    case 2:
    return Colors.white;
    default :
    return Colors.white;
  }
}


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
body: Column(
  children: [
    Expanded(child: pages[index]),
  ],
),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        useLegacyColorScheme: true,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      
        backgroundColor:getColor(),
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: ( int value) {
          setState(() {
            index=value;
          });
        },

        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled,color: Colors.black,),label: 'Home',),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.prayingHands,color: Colors.black,),label: 'Meditation'),
        BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.black,),label: 'Account')
      ]),
    );
  }
}