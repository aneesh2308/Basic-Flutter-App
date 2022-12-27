import 'package:flutter/material.dart';
import 'package:untitled1/Data/students.dart';
class Dashboard1 extends StatefulWidget {
  final int currentId;
  const Dashboard1({super.key, required this.currentId});
  @override
  _Dashboard1State createState() => _Dashboard1State();
}
class _Dashboard1State extends State<Dashboard1> {
  gradecal(int num){
    late String grade;
    if(num<35){
      grade="F";
    }else if(num>35 && num<=50){
      grade="E";
    }else if(num>50 && num<=65){
      grade="D";
    }else if(num>65 && num<=75){
      grade="C";
    }else if(num>75 && num<=85){
      grade="B";
    }else if(num>85 && num<100){
      grade="A";
    }
    return grade;
  }
  @override
  Widget build(BuildContext context)=>Scaffold(
    appBar: AppBar(
        title: const Text('Dashboard',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        elevation: 20,
        titleSpacing: 20
    ),
    body:Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ListView.builder(
              itemCount: allStudents[widget.currentId].Course.length,
              itemBuilder: (context, index){
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Course name',
                                style: TextStyle(fontSize:20, fontWeight: FontWeight.w500)
                            ),
                            Text(allStudents[widget.currentId].Course[index].toString(),
                              style: const TextStyle(fontSize:20, fontWeight: FontWeight.w500)
                            )
                          ],
                        ),
                      ),
                      ListBody(
                        children: [
                          Center(
                           child: Text('Marks Obtained - ${allStudents[widget.currentId].Grades[index].toString()}',
                           style: const TextStyle(fontSize:16),
                           ),
                          ),
                          Center(
                            child: Text('Grade Obtained - ${gradecal(allStudents[widget.currentId].Grades[index])}',
                              style: const TextStyle(fontSize:16),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                );
              }))
        ],
      ),
    ),
  );
}