import 'package:fitnesshive/bulkingDietPage.dart';
import 'package:fitnesshive/cheatmeal.dart';
import 'package:fitnesshive/joggingFile.dart';
import 'package:fitnesshive/main.dart';
import 'package:fitnesshive/model/dietpage.dart';
import 'package:fitnesshive/workout.dart';
import 'package:fitnesshive/yoga.dart';
import 'package:flutter/material.dart';


class FitnesshomePage extends StatefulWidget {
  const FitnesshomePage({super.key});

  @override
  State<FitnesshomePage> createState() => _FitnesshomePageState();
}

class _FitnesshomePageState extends State<FitnesshomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
      children: [
        Padding(padding: EdgeInsets.all(8.0),
        child: Text('Select your Workout',style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),),
        SizedBox(height: 230,
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50,),
          child: GestureDetector(
            onTap: (){

            },
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>workoutHome()));
              },
              enableFeedback: true,
              splashColor: Colors.lightBlueAccent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                child: Card(
                  elevation: 8,
                  child: Stack(
                    
                    children: [
                      Positioned.fill(child: Container(
                        
                        decoration: BoxDecoration(
                    
                          
                          image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        
                      )
                      ),
                      Positioned(
                        bottom: -1,
                        left: 0,
                        right: 0,
                        child: Container(
                          
                          child: Center(child: Container(
                            child: Padding(padding: EdgeInsets.only(top: 40,right: 250),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 4),
                                  child: Container(
                                    height: 25,
                                    width: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(),
                                      child: Center(child: Text('Personalized',style: TextStyle(
                                        color: Colors.black
                                      ),)),
                                    ),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 1,
                                          spreadRadius: 2,
                                          color: Colors.black
                                        )
                                      ],
                                      color: const Color.fromARGB(255, 161, 245, 164),
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                 Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 4),
                                  child: Container(
                                    height: 25,
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(),
                                      child: Center(child: Text('Full body',style: TextStyle(
                                        color: Colors.black
                                      ),)),
                                    ),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          
                                          spreadRadius: 2,
                                          color: Colors.black
                                        )
                                      ],
                                      gradient: LinearGradient(colors: [
                                        Colors.white,
                                        const Color.fromARGB(255, 223, 222, 222)
                                      ]),
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                  ),
                                ),
                                
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(width: 10,),
                                    Text('Muscle Gain',style: TextStyle(color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),),
                                    SizedBox(width: 2,),
                                    Icon(Icons.fitness_center,color: Colors.green,),
                                   
                                  ],
                                ),
                              ],
                            ),),
                          ),),
                          
                          decoration: BoxDecoration(
                            
                            boxShadow: [
                              
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                              Colors.white,
                              Colors.white,
                              Colors.white,
                              
                              Colors.white30,
                              Colors.transparent
                            ]),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                          ),
                        ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        
        ),),
        SizedBox(
          height: 10,
          child: Container(
            color: Colors.white,
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 0,top: 0,left: 0,right: 370,),
        child: Text('Workouts',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
        Padding(
          padding: const EdgeInsets.only(top: 0,right: 350),
          child: Text('Choose your Style',style: TextStyle(color: Colors.blueGrey),),
        ),
        SizedBox(height: 130,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  
                  enableFeedback: true,
                  splashColor: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WorkoutPage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    child: Workoutcard(img: 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                     name: 'Strength', name2: '30 mins', icons: Icon(Icons.sports_gymnastics), ontap: (){},),
                  ),
                )
              ),
              Padding(padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>YogaPage()));
                },
                enableFeedback: true,
                splashColor: Colors.lightBlue,
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                  child: Workoutcard(img: 'https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                   name: 'Yoga',
                    name2: '25 Mins',
                     icons:Icon(Icons.sunny),
                      ontap: (){}),
                ),
              ),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>JoggingPage()));
                      },
                      enableFeedback: true,
                      splashColor: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                      child: Padding(padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                      child: Workoutcard(img: 'https://images.unsplash.com/photo-1603455778956-d71832eafa4e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8am9nZ2luZ3xlbnwwfHwwfHx8MA%3D%3D',
                       name: 'Jogging', name2: '30 Min', icons: Icon(Icons.directions_run_rounded), ontap: (){}),),
                    ),
                  )
            ],
          ),

        ),),
                Padding(padding: EdgeInsets.only(bottom: 0,top: 0,left: 0,right: 400,),
        child: Text('Diet',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
        Padding(
          padding: const EdgeInsets.only(top: 0,right: 350),
          child: Text('Choose your Diet',style: TextStyle(color: Colors.blueGrey,),),
        ),
        SizedBox(height: 130,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  enableFeedback: true,
                  borderRadius: BorderRadius.circular(15),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BulkPage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    child: Dietcard(img: 'https://plus.unsplash.com/premium_photo-1673809798817-457be4736fa4?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                     name: 'Bulking Diet', name2: 'Gain mass', icons: Icon(Icons.egg_sharp), ontap: (){},),
                  ),
                )
              ),
              Padding(padding: EdgeInsets.all(8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>dietPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                  child: Dietcard(img: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGRpZXR8ZW58MHx8MHx8fDA%3D',
                   name: 'Cutting Diet',
                    name2: 'Weight loss',
                     icons:Icon(Icons.food_bank_sharp),
                      ontap: (){}),
                ),
              ),),
                  Padding(padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    enableFeedback: true,
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cheatmeal()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                      child: Dietcard(img: 'https://images.unsplash.com/photo-1576402187878-974f70c890a5?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Zm9vZHN8ZW58MHx8MHx8fDA%3D',
                       name: 'Cheat day', name2: 'Cheat meals', icons: Icon(Icons.fastfood_rounded), ontap: (){}),
                    ),
                  ),)
            ],
          ),
        ),)
      ],
      ),
    );
  }
}
class Workoutcard extends StatelessWidget {
  final String  img;
 final String name;
 final String name2;
 final Icon icons;
 final VoidCallback ontap;
  

   const   Workoutcard({ super.key, required this.img,required this.name,required this.name2,required this.icons,required this.ontap});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[Container(
        
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(img),fit: BoxFit.cover),
          color: Colors.lightGreenAccent,
          borderRadius: BorderRadius.circular(15)
        ),
      ),
      Positioned(
        bottom: -1,
        left: 0,
        right: 0,
        child: Container(
          
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 20,width: 100,
                child: Center(child: Text(name),),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.greenAccent,
                    Colors.lightGreenAccent,
                   
                  ]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.transparent,
                      spreadRadius: 2
                    )
                  ],
                  borderRadius: BorderRadius.circular(15)
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 20,width: 100,
                
                child: Center(child: Text(name2),),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.transparent,
                      spreadRadius: 1
                    )
                  ],
                  borderRadius: BorderRadius.circular(15)
                ),),
              ),
              icons
              
            ],
          ),
          height: 96,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
            Colors.white,
          
            Colors.transparent
          ]),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
        ),
      ))
      ]
    );
  }
}

class Dietcard extends StatelessWidget {
  final String  img;
 final String name;
 final String name2;
 final Icon icons;
 final VoidCallback ontap;
  

   const   Dietcard({ super.key, required this.img,required this.name,required this.name2,required this.icons,required this.ontap});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[Container(
        
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(img),fit: BoxFit.cover),
          color: Colors.lightGreenAccent,
          borderRadius: BorderRadius.circular(15)
        ),
      ),
      Positioned(
        bottom: -1,
        left: 0,
        right: 0,
        child: Container(
          
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 20,width: 100,
                child: Center(child: Text(name),),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.blue,
                    Colors.lightBlueAccent
                  ]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 2
                    )
                  ],
                  borderRadius: BorderRadius.circular(15)
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 20,width: 100,
                
                child: Center(child: Text(name2),),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 1
                    )
                  ],
                  borderRadius: BorderRadius.circular(15)
                ),),
              ),
              icons
              
            ],
          ),
          height: 96,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
            Colors.white,
          
            Colors.transparent
          ]),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
        ),
      ))
      ]
    );
  }
}