import 'package:flutter/material.dart';
import '../../Data/students.dart';
import '../../Data/teachers.dart';
import '../../Model/student.dart';
import 'Details.dart';
class TeacherDashboard extends StatefulWidget {
  final int currentId;
  const TeacherDashboard({super.key,required this.currentId});
  @override
  _TeacherDashboardState createState() => _TeacherDashboardState();
}
class _TeacherDashboardState extends State<TeacherDashboard> {
  late List<Student> students;
  int? sortColumnIndex;
  bool isAscending = false;
  bool selectedStudent = false;
  @override
  void initState() {
    super.initState();
    List<Student> allStudents1 = [];
    for(int i=0;i<allStudents.length;i++){
      if(allTeachers[widget.currentId].Studystud.contains(allStudents[i].Reg)){
        allStudents1.add(allStudents[i]);
      }
    }
    allStudents1.sort((student1,student2)=>student1.Reg.compareTo(student2.Reg));
    students = List.of(allStudents1);
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    body: TabBarView(
        children:<Widget>[
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: buildDataTable(),
        ),
        )]
    ),
  );

  Widget buildDataTable() {
    final columns = ['Registration Number', 'Name'];
    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(students),
      dataTextStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
      columnSpacing: MediaQuery.of(context).size.width*0.3,
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns.map((String column) => DataColumn(
    label: Text(column),
    onSort: onSort,
  )).toList();

  List<DataRow> getRows(List<Student> students) => students.map((Student student) {
    final cells = [student.Reg, student.Name];
    return DataRow(
        selected: selectedStudent,
        onSelectChanged: (isSelect)async{
          var result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail(currenStudent: student, currentId:widget.currentId)));
          setState(() {
            students.removeWhere((element) => element.Reg==result.toString());
            allTeachers[widget.currentId].Studystud.removeWhere((element) => element==result.toString());
          });
        },
        cells: getCells(cells));
  }).toList();
//
  List<DataCell> getCells(List<dynamic> cells) => cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      students.sort((student1, student2) =>
          compareString(ascending, student1.Reg, student2.Reg));
    } else if (columnIndex == 1) {
      students.sort((student1, student2) =>
          compareString(ascending, student1.Name, student2.Name));
    }
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}

class Dashboard extends StatelessWidget {
  final int currentId;

  Dashboard({super.key, required this.currentId});
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 1,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
          actions: <Widget>[
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.logout, color: Colors.white))
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: TeacherDashboard(currentId: currentId)
      ),
    ),
  );
}