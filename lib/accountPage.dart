import 'package:flutter/material.dart';

class myAccount extends StatelessWidget {
  const myAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Account'),),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: ListTile(
              trailing: Icon(Icons.edit),
              title: Text('John'),
              subtitle: Text('John@gmail.com'),

              leading: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNKHcJO1di6ic74BjlLJ2SJiAUEMDPz94mBBHdxws13Asx1F7XcK7Ihx2PICMUsnGOp0A&usqp=CAU'),
              ),
            ),
          ),
          SizedBox(height: 200
          ,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  
                ],
              ),
              decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15)
            ),),
          ),)
        ],
      ),
    );
  }
}