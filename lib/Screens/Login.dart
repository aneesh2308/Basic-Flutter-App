import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Data/teachers.dart';
import 'package:untitled1/Screens/Students/Dashboard.dart';
import 'package:untitled1/Screens/Teacher/Dashboard.dart';
import '../Data/students.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final Key _formKey = GlobalKey<FormState>();
  late String RegisterationID='', Password='', Role='Student', OtherRole='Teacher';
  bool error=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title:const Text("Login",style: TextStyle(color: Colors.white)),
      //   centerTitle:true,
      //   titleSpacing: 2,
      // ),
      body:Center(
        child: SingleChildScrollView(
            child:Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/20944201.jpg'),
                    ),
                  ),
                ),
                SafeArea(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Welcome to Result App',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Login into your Account',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 25.0),
                          Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  TextField(
                                    decoration: InputDecoration(
                                        labelText: "$Role Registeration ID",
                                        hintText: "ex. 12345",
                                        filled: true,
                                        fillColor: Colors.white70,
                                        border:const OutlineInputBorder(
                                            borderSide:BorderSide(color: Colors.black,width: 10.0,style:BorderStyle.solid ),
                                            borderRadius: BorderRadius.all(Radius.circular(50.0))
                                        )
                                    ),
                                    onChanged: (val){
                                      setState((){
                                        error=false;
                                      });
                                      RegisterationID=val;
                                    },
                                  ),
                                  const SizedBox(height: 25.0),
                                  TextField(
                                    decoration: const InputDecoration(
                                        labelText: 'Password',
                                        hintText: 'ex. 12345',
                                        filled: true,
                                        fillColor: Colors.white70,
                                        border:OutlineInputBorder(
                                            borderSide:BorderSide(color: Colors.black,width: 10.0,style:BorderStyle.solid ),
                                            borderRadius: BorderRadius.all(Radius.circular(50.0))
                                        )
                                    ),
                                    onChanged: (val){
                                      setState((){
                                        error=false;
                                      });
                                      Password=val;
                                    },
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(error?"Wrong Password or Registration Number":'',style: const TextStyle(color:Colors.redAccent,fontSize:8)),
                                  const SizedBox(height: 15.0),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if(Role=='Student'){
                                            bool check=false;
                                            if(RegisterationID!=''){
                                              for(int i=0;i<allStudents.length;i++){
                                                if(allStudents[i].Reg == RegisterationID && allStudents[i].Password==Password){
                                                  check=true;
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard1(currentId:i)));
                                                }
                                              }
                                            }
                                            if(check==false){
                                              setState((){
                                                error=true;
                                              });
                                            }
                                          }else{
                                            bool check=false;
                                            if(RegisterationID!=''){
                                              for(int i=0;i<allTeachers.length;i++){
                                                if(allTeachers[i].Reg == RegisterationID && allTeachers[i].Password==Password){
                                                  check=true;
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard(currentId:i)));
                                                }
                                              }
                                            }
                                            if(check==false){
                                              setState((){
                                                error=true;
                                              });
                                            }
                                          }
                                        },
                                        style: ButtonStyle(
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30)
                                                )
                                            ),
                                            backgroundColor: const MaterialStatePropertyAll(Colors.cyan),
                                            textStyle: const MaterialStatePropertyAll(TextStyle(color:Colors.white))
                                        ),
                                        child: const Center(child: Text('Login',style: TextStyle(color: Colors.white),)),
                                      )
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(10,20,10,20),
                                    child: Text.rich(
                                        TextSpan(children: [
                                          TextSpan(text: "Not a $Role but a $OtherRole?"),
                                          TextSpan(text: " For $OtherRole",
                                              recognizer: TapGestureRecognizer()..onTap=(){
                                                setState(() {
                                                  String temp = Role;
                                                  Role = OtherRole;
                                                  OtherRole = temp;
                                                });
                                              },
                                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)
                                          )
                                        ])
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    )
                ),
              ],
            )
        ),
      )
    );
  }

}