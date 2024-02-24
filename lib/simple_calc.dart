import 'package:flutter/material.dart';
import 'buttonClass.dart';

class calculator extends StatefulWidget{
  static const routeName='calc';
  @override
  State<StatefulWidget> createState() {
    return calculatorState();
  }

}
class calculatorState extends State<calculator>{
  String resText='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Calculator')),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(resText,style: TextStyle(fontSize: 23),)
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buttonClass(buttonText: '7',onPressedFunction: onPressedDigit,),
                buttonClass(buttonText: '8',onPressedFunction: onPressedDigit,),
                buttonClass(buttonText: '9',onPressedFunction: onPressedDigit,),
                buttonClass(buttonText: '÷',onPressedFunction: onPressedOperator,),

              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buttonClass(buttonText: '4',onPressedFunction: onPressedDigit,),
                buttonClass(buttonText: '5',onPressedFunction: onPressedDigit,),
                buttonClass(buttonText: '6',onPressedFunction: onPressedDigit,),
                buttonClass(buttonText: 'X',onPressedFunction: onPressedOperator,),

              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buttonClass(buttonText: '1',onPressedFunction: onPressedDigit,),
                buttonClass(buttonText: '2',onPressedFunction: onPressedDigit,),
                buttonClass(buttonText: '3',onPressedFunction: onPressedDigit,),
                buttonClass(buttonText: '+',onPressedFunction: onPressedOperator,),

              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buttonClass(buttonText: '.',onPressedFunction: onPressedDigit,),
                buttonClass(buttonText: '0',onPressedFunction: onPressedDigit,),
                buttonClass(buttonText: '=',onPressedFunction: onPressedEqal),
                buttonClass(buttonText: '-',onPressedFunction: onPressedOperator,),

              ],
            ),
          ),
        ],
      ),
    );

  }
  void onPressedDigit(String text){
    resText +=text;
    setState(() {

    });
  }
  String LHS='';
  String savedOperator='';
  void onPressedOperator(String operator){
    if(savedOperator.isEmpty){
      LHS=resText;
    }
    else{
      String RHS=resText;
      LHS=calc(LHS,savedOperator,RHS);

    }
    savedOperator=operator;
    resText='';
    setState(() {

    });
  }
  String calc(String LHS,String operator,String RHS){
    double res=0;
    double num1=double.parse(LHS);
    double num2=double.parse(RHS);
    if(operator=='+'){
      res=num1+num2;
    }
    else if(operator=='-'){
      res=num1-num2;
    }
    else if(operator=='X'){
      res=num1*num2;
    }
    else if(operator=='÷'){
      res=num1/num2;
    }
    return res.toString();
  }
  void onPressedEqal(String op){
    String RHS=resText;
    resText=calc(LHS, savedOperator, RHS);
    LHS='';
    savedOperator='';
    setState(() {

    });
  }
}