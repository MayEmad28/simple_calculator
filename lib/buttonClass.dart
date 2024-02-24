import 'package:flutter/material.dart';

class buttonClass extends StatelessWidget{
  String buttonText;
  Function onPressedFunction;
  buttonClass({required this.buttonText,required this.onPressedFunction});
  @override
  Widget build(BuildContext context) {
   return Expanded(
         child: Container(
           margin: EdgeInsets.all(2),
           child: ElevatedButton(
               onPressed: (){
                 onPressedFunction(buttonText);
               },
               child: Text(buttonText,style: TextStyle(fontSize: 23),)),
         ),
   );
  }

}