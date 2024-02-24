import 'package:flutter/material.dart';
import 'simple_calc.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:calculator.routeName ,
      routes: {
        calculator.routeName:(context)=>calculator(),
      },
    );
  }
}