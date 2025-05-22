
import 'package:fitnesshive/FitnessHome.dart';
import 'package:fitnesshive/Meditation.dart';
import 'package:fitnesshive/accountPage.dart';
import 'package:fitnesshive/bottomNavigation.dart';
import 'package:fitnesshive/bulkingDietPage.dart';
import 'package:fitnesshive/cheatmeal.dart';
import 'package:fitnesshive/joggingFile.dart';
import 'package:fitnesshive/model/dietpage.dart';

import 'package:fitnesshive/model/userModel.dart';
import 'package:fitnesshive/onboarding.dart';


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(workoutAdapter());
  await Hive.openBox<workout>('Fitness');
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:OnboardingFitness(),
    debugShowCheckedModeBanner: false,);
  }
}
class workoutHome extends StatefulWidget {
   

  @override
  State<workoutHome> createState() => _workoutHomeState();
}

class _workoutHomeState extends State<workoutHome> {
final Box<workout> Fitness = Hive.box('Fitness');
final TextEditingController Namecontroller = TextEditingController();
final TextEditingController setController = TextEditingController();
final TextEditingController repController = TextEditingController();
final TextEditingController typeController = TextEditingController();

void addWorkout(BuildContext context){
  final name = Namecontroller.text;
  final sets = int.tryParse(setController.text);
  final reps = int.tryParse(repController.text);
  final type = typeController.text;

if(name.isNotEmpty&&sets!=null&&reps!=null&&type.isNotEmpty){
  Fitness.add(workout(name, sets, reps, type));
  Namecontroller.clear();
  setController.clear();
  repController.clear();
  typeController.clear();
}
}

void deleteWorkout(int index){
  setState(() {
    Fitness.deleteAt(index);
  });
}

void editWorkout(int index,workout Exercise){
  Namecontroller.text=Exercise.name;
  setController.text=Exercise.sets.toString();
  repController.text=Exercise.reps.toString();
  typeController.text=Exercise.type;
showDialog(context: context, builder: (_){
return AlertDialog(
  
  title: Text('Edit Workout'),
  content: Row(mainAxisSize: MainAxisSize.min,
    children: [
      Expanded(child: TextField(
        
        controller: Namecontroller,
        decoration: InputDecoration(
          labelText: 'name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
      )),
      SizedBox(width: 8,),
      Expanded(child: TextField(
        controller: setController,
        decoration: InputDecoration(
          labelText: 'sets',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
      )),
      SizedBox(width: 8,),
      Expanded(child: TextField(
        controller: repController,
        decoration: InputDecoration(
          labelText: 'reps',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
      )),
      SizedBox(width: 8,),
      Expanded(child: TextField(
        controller: typeController,
        decoration: InputDecoration(
          labelText: 'Type',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
      ))
      
    ],
  ),
  actions: [
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey
      ),
      onPressed: (){
      final EditName = Namecontroller.text;
      final editSet = int.tryParse(setController.text);
      final editReps = int.tryParse(repController.text);
      final edittype = typeController.text;

if(EditName.isNotEmpty&&editSet!=null&&editReps!=null&&edittype.isNotEmpty){
  Fitness.putAt(index, workout(EditName, editSet, editReps, edittype));
 Namecontroller.clear();
 setController.clear();
 repController.clear();
 typeController.clear();
 setState(() {
    Navigator.of(context).pop(index);
 });
}




    }, child: Text('Done',style: TextStyle(color: Colors.white),))
  ],
);
});



}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
       body: Container(
        decoration: BoxDecoration(
         image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1549476464-37392f717541?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGZpdG5lc3N8ZW58MHx8MHx8fDA%3D'),fit: BoxFit.fill)
        
        ),
         child: Column(
          children: [
             Text('Personalize Your Workouts',style: TextStyle(fontSize: 26,color: Colors.white),),
            Padding(padding: EdgeInsets.all(10),
            child: TextField(
              controller: Namecontroller,
              decoration: InputDecoration(
                
                                filled: true,
                fillColor: Colors.white54,
                hintText: 'Name',
                hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                  
                  
                ),
                
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),),
             Padding(padding: EdgeInsets.all(10),
            child: TextField(
              controller: setController,
              decoration: InputDecoration(
                hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                filled: true,
                fillColor: Colors.white54,
                hintText: 'Sets',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                  
                  
                ),
              ),
            ),),
             Padding(padding: EdgeInsets.all(10),
            child: TextField(
              controller: repController,
              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                  
                  
                ),
                filled: true,
                fillColor: Colors.white54,
                hintText: 'Reps',
                hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),),
             Padding(padding: EdgeInsets.all(10),
            child: TextField(
              controller: typeController,
              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                  
                  
                ),
                                filled: true,
                fillColor: Colors.white54,
                hintText: 'Type',
                
                hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),),
          InkWell(
            enableFeedback: true,
            
            splashColor: Colors.lightBlueAccent,
            onTap: () {
              setState(() {
                addWorkout(context);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Container(
                  height: 50,
                  width: 80,
                  child: Center(child: Text('ADD',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),),),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.white,
                      Colors.white
                    ]),
                    borderRadius: BorderRadius.circular(18)
                  ),
                ),
              ),
            ),
          ),
            Expanded(
              
              child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 1,
                    blurRadius: 10
                  )
                ],
                borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(80),topEnd: Radius.circular(80))
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 35,),
                child: Stack(
                  children: [
                    Positioned.fill(child: Lottie.network('https://lottie.host/4d65c6b6-a74e-4783-ad1f-e583857c8d0c/D5Vm2dnNyA.json')),
                    ValueListenableBuilder(valueListenable: Fitness.listenable(),
                 builder:(context,Box<workout>box,_){
                  final workouts=box.values.toList();
                  return ListView.builder(
                    itemCount: workouts.length,
                    itemBuilder: (context,index){
                    final workoutIndex=workouts[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                       decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 15
                        )]
                       ),
                        child: ListTile(
                          
                          title: Row(
                            children: [
                              Text('Name: ${workoutIndex.name}'),
                              SizedBox(width: 40,),
                              
                              Text('Sets: ${workoutIndex.sets}')
                            ],
                          ),
                          subtitle: Row(
                            children: [
                             
                              Text('Type: ${workoutIndex.type}'),
                              SizedBox(width: 60,),
                               Text('Reps: ${workoutIndex.reps}'),
                              
                              
                            ],
                          ),
                          trailing: Row(mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: (){
                              editWorkout(index, workoutIndex);
                            }, icon: Icon(Icons.edit)),
                            IconButton(onPressed: (){
                              deleteWorkout(index);
                            }, icon: Icon(Icons.delete)),
                                 
                          ],),
                        ),
                      ),
                    );
                    
                  });
                 }),
                  ],
                )
              ),
            ))
          ],
         ),
       ),
    );
  }
}