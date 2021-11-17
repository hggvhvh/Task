import 'package:flutter/material.dart';
import 'package:projectfirst/main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }
  _navigateHome() async {
    await Future.delayed(Duration(milliseconds: 3500), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Welcome',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
