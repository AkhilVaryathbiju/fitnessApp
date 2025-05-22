 import 'package:fitnesshive/startYoga.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class YogaPage extends StatefulWidget {
  const YogaPage({super.key});

  @override
  State<YogaPage> createState() => _YogaPageState();
}

class _YogaPageState extends State<YogaPage> {
List<Yoga>YogaPoses=[
Yoga(Name: 'Big Toe Pose',AssetUrl: 'assets/images/yoga1.json'),
Yoga(Name: 'Cow Pose',AssetUrl: 'assets/images/upward.json'),
Yoga(Name: 'Cobra Pose',AssetUrl: 'assets/images/cobraPose.json'),
Yoga(Name: 'Bridge pose',AssetUrl: 'assets/images/CatCow.json'),
Yoga(Name: 'Upward Plank', AssetUrl: 'assets/images/upwardPlankk.json'),
Yoga(Name: 'warrior Pose', AssetUrl: 'assets/images/hhh.json'),
Yoga(Name: 'Warrior Pose 2', AssetUrl: 'assets/images/wariorpose1.json'),
Yoga(Name: 'Seated Forward Bend', AssetUrl: 'assets/images/aaa.json')  
];


Widget YogaBuild(){
  return ListView.builder(
    itemCount: YogaPoses.length,
    itemBuilder: (context,index){
    final poses = YogaPoses[index];
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          
          title: Text(poses.Name),
          leading: SizedBox(
            height: 60,
            width: 60,
            child: Lottie.network(poses.AssetUrl),
          ),
          
        ),
      ),
    );
  });
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(child: YogaBuild()),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StartyogaPage(poses:YogaPoses)));
            }, child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(child: Text('Start',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),)))))
        ],
      ),
  
    );
  }
}
class Yoga {
  String Name;
  String AssetUrl;
Yoga({required this.Name, required this.AssetUrl});
}