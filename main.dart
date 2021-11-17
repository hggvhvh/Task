import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectfirst/register.dart';
import 'package:projectfirst/splashscreen.dart';
import 'sign_in.dart';
import 'splashscreen.dart';
import 'screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.grey
      ),
      home: Splash()
    );
  }}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
          child: Padding(

            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),

            child: Column(

              children: [Flexible(
                child: Column(
        children: [
                Center(
                  child: Container(

                    child: Image(image: AssetImage('asset/11.jpeg'),
                    width: double.infinity,
                    )
                  ),
                ),
                SizedBox(height: 20,),
                Text('Enterprise Team \n  collaboration.',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),
                ),SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.only(right: 10,left: 40),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text('Bring together your files,your tools,'
                          'project and people.Including a new mobile '
                          'and desktop application.',
                        style: TextStyle(color: Colors.grey),),
                    ),
                  ),
                  ],
                ),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(18)
                ),
                child: Row(
                children: [

                    Expanded(
                      child: TextButton(onPressed: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => Register()));

                      }, child: Text('Register',style: TextStyle(backgroundColor: Colors.transparent, fontSize: 17,fontWeight: FontWeight.w600),)),
                    ),
                    Expanded(

                      child: TextButton(onPressed: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => SignInPage()));
                      }, child: Text('Sign Up',style: TextStyle(backgroundColor: Colors.transparent,
                          fontSize: 17,fontWeight: FontWeight.w600, ),)),
                    )
                  ],
                ),
              )
              ]
            ),
          )
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  final String buttonName;

  final Color bgColor;
  final Color textColor;

  MyTextButton({required this.buttonName,required this.bgColor,required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 60,
    width: double.infinity,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(18),
    color: bgColor,
    ),
    child: TextButton(
    style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith((states) => Colors.black12)
    ),
     onPressed: () { },
     child: Text(buttonName,style: TextStyle(color: textColor),)));

  }
}














