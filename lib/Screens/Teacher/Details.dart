import 'package:flutter/material.dart';
import 'package:untitled1/Data/teachers.dart';
import 'package:untitled1/Model/student.dart';
import '../../components/Change.dart';

class Detail extends StatefulWidget {
  final Student currenStudent;
  final int currentId;
  const Detail({super.key,required this.currenStudent,required this.currentId});
  @override
  _DetailState createState() => _DetailState();
}
class _DetailState extends State<Detail> {
  List<bool> show=[];
  @override
  void initState(){
    super.initState();
      for(int i=0;i<widget.currenStudent.Course.length;i++){
        if(allTeachers[widget.currentId].Course.contains(widget.currenStudent.Course[i])){
          show.add(true);
        }else{
          show.add(false);
        }
      }
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
        title: Text('${widget.currenStudent.Name} Report Card',style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(onPressed: (){
            // allStudents.removeWhere((element) => element.Reg==widget.currenStudent.Reg);
            Navigator.pop(context,widget.currenStudent.Reg);
          }, icon: const Icon(Icons.delete, color: Colors.white))
        ],
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
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: widget.currenStudent.Course.length,
                  itemBuilder: (context, index){
                    return show[index]?Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Course name - ${widget.currenStudent.Course[index]}',
                                    style: const TextStyle(fontSize:20, fontWeight: FontWeight.w500)
                                ),
                                const SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    Text('Marks Obtained - ${widget.currenStudent.Grades[index].toString()}',
                                      style: const TextStyle(fontSize:16, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(icon:const Icon(Icons.edit),
                              onPressed:()async{
                                final updatedGrade = await showCustomDialog(context,title:'Change Grade', value: widget.currenStudent.Grades[index].toString());
                                setState(() {
                                  widget.currenStudent.Grades[index]=int.parse(updatedGrade.toString());
                                });
                              },)
                          ],
                        )
                    ):Container();
                  }))
        ],
      ),
    ),
  );
}