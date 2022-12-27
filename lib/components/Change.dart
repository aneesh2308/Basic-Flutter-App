import 'package:flutter/material.dart';

Future<T?> showCustomDialog<T>(
    BuildContext context, {
      required String title,
      required String value,
    }) =>
    showDialog<T>(
      context: context,
      builder: (context) => CustomDialog(
        title: title,
        value: value,
      ),
    );

class CustomDialog extends StatefulWidget {
  final String title;
  final String value;

  const CustomDialog({super.key, required this.title, required this.value});

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(widget.title),
    content: TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide:BorderSide(color: Colors.black,width: 10.0,style:BorderStyle.solid ),
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
      ),
    ),
    actions: [
      ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                )
            ),
            backgroundColor: const MaterialStatePropertyAll(Colors.cyan),
            textStyle: const MaterialStatePropertyAll(TextStyle(color:Colors.white))
        ),
        child: const Text('Change'),
        onPressed: (){
          if(int.parse(controller.text)>=0 && int.parse(controller.text)<=100){
            Navigator.of(context).pop(int.parse(controller.text));
          }
        },
      )
    ],
  );
}