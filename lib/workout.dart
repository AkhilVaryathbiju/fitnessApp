import 'package:fitnesshive/StartWorkout.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
List<exercise> Workouts=[
  exercise(name: 'Plank', lottieUrl: 'https://lottie.host/eef22bad-2d7b-4cb6-81b6-36526af87c3b/P6oj9QbEoI.json',),
  exercise(name: 'Pushups', lottieUrl: 'https://lottie.host/b3d7db9f-9ee8-4c71-9de6-da78447a8906/3hAeBs9F47.json',),
  exercise(name: 'Squats', lottieUrl: 'https://lottie.host/c373a516-1389-48e8-9b50-d8016e7dc328/GaTfiiVDBF.json'),
  exercise(name: 'Crunches', lottieUrl: 'https://lottie.host/f7f2240e-e921-4147-ac72-d2426f223f14/NP6rUgvQ4S.json'),
  exercise(name: 'Jumping jacks', lottieUrl: 'https://lottie.host/112ecd07-a1c4-4f2e-96a7-1df0400bfcf6/GIsmyhc0dx.json'),
  exercise(name: 'Bench press', lottieUrl: 'assets/images/man-doing-inclined-press (2).json'),
  exercise(name: 'Dips', lottieUrl: 'assets/images/man-doing-dips.json'),
  exercise(name: 'Barbell Curl', lottieUrl: 'assets/images/man-doing-barbell-curl.json'),
  exercise(name: 'Barbell Lunges', lottieUrl: 'assets/images/man-doing-barbell-lunges.json'),
  exercise(name: 'Seated cable row', lottieUrl: 'assets/images/man-doing-seated-cable-row-workout.json')
];

  @override
  Widget build(BuildContext context) {

Widget exerciseBuild(){
  return ListView.builder(
    itemCount: Workouts.length,
    itemBuilder: (context,index){
   final Workout=Workouts[index];
   return Padding(
     padding: const EdgeInsets.all(7.0),
     child: Card(
      
      color: Colors.white,
      child: ListTile(
        title: Text(Workout.name),
        leading: SizedBox(
          height: 60,
          width: 60,
          child: Lottie.network(Workout.lottieUrl),
        ),
        // trailing: Text('12  x  3'),
      ),
     ),
   );
  }
  );
}

    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(child: exerciseBuild()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StartworkoutPage(workouts: Workouts)));
            }, child: Container(
              child: Center(child: Text('Start Workout',style: TextStyle(
                color: Colors.white
              ),),),
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15)
              ),
            )),
          )
        ],
      ),
      
    );
  }
}



//exercise 
class exercise{
final String name;
final String lottieUrl;


exercise({required this.name,required this.lottieUrl,});
}