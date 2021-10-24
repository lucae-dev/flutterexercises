//import 'dart:html';

import 'package:flutter/material.dart';
//import 'screens/TextSection.dart';
void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 @override
 Widget build (BuildContext context) {
  
   return MaterialApp(
     home: Scaffold(appBar:  AppBar (
     title: const Text("Hi, this is my first Flutter App, \ni hate it! :)")
   ),

   body:  Center(
     child: HelloWorld()
       
   )
   ));
 }
}


class HelloWorld extends StatefulWidget{


   HelloWorld({Key? key}): super(key:key);

@override
 HelloWorldState createState()=> HelloWorldState();
}


class HelloWorldState extends State<HelloWorld>{
 TextEditingController numero= TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Column( 
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
          Row(
          children: [
          Expanded(
            child: TextFormField(
            controller: numero,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Search a movie',
          ),        
          ),
          ),
          ],
          ),
       Expanded( 
        child:  HelloWorldPlusGenerator(numero: numero.text.isEmpty? 1 : int.parse(numero.text) )),
    ],);   
  }

}


class HelloWorldPlus extends StatelessWidget{
 final Color color;
 final int number;

const HelloWorldPlus({this.color= Colors.blue, this.number=20, Key? key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello World $number",
      style: TextStyle(fontSize: 3*number.toDouble(), fontWeight: FontWeight.w500, color: color),
    );
  }

}

class HelloWorldPlusGenerator extends StatefulWidget{
   int numero=1;

  HelloWorldPlusGenerator({this.numero=1, Key? key}): super(key: key);

  @override
  HelloState createState() => HelloState();

  }  

  class HelloState extends State<HelloWorldPlusGenerator> {
    
  @override
  Widget build(BuildContext context) {
    List<Widget> chdn = [];
    for(int i=0; i<widget.numero && i<10;i++)
      {  
        chdn.add(HelloWorldPlus(color: Color.fromRGBO(8*i%255, 16*i%255, 32*i%255, 1.0), number: i+1));
      }

    return Column(children: chdn) ;
  }

  }
