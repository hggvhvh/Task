import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body: SafeArea(child: Column(
         children: [
           Container(
             width: MediaQuery.of(context).size.width * 0.8,
             child: Image(image: AssetImage('asset/11.jpeg'),fit: BoxFit.cover,),
           )
         ],
       )),
    );
  }
}