import 'package:flutter/material.dart';
export 'sign_in.dart';
export 'splashscreen.dart';
export 'screen.dart';
export 'register.dart';
export 'profile.dart';
export 'userpage.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
 final double profileHeight = 144;
 final double coverHeight = 280;

  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          buildTop(),
          buildContent(),
        ],
      )

    );
  }
  Widget buildContent() => Column(
    children: [
      SizedBox(height: 80,),
       Text("Tijan Ayomide",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),
       ),SizedBox(height: 8,),
      Text("Developer Imposter Syndrome",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),
      ),SizedBox(height: 20,),
      Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(

            children: [
                       Text('About',style:TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Colors.white)),

            ],
          ), SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10,bottom: 30),
                child: SingleChildScrollView(
                  child: Column(

                  children: [
                  Text('Flutter Software Engineer and Google \n'
                      'Developer Expert for Flutter & Dart with \n'
                      'years of experiance as a consultant for\n'
                      'multiple companies in Europe,USA and \n'
                      'Asia.\n'
                      'My mission is to create a better world  \n'
                      'with beautiful Flutter app design and '
                      'software!!',style:TextStyle(fontWeight: FontWeight.w300,fontSize: 16,color: Colors.grey)),


        ],
      ),
                ),
              )

       ]
          ),
      )
 )
] );


  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        buildCoverImage(),
        Positioned(
          top: top,
          child: buildProfileImage(),)

      ],

    );
  }

  Widget buildCoverImage() => Container(
    color: Colors.grey,

    child: Image.asset('asset/coding.jpeg',fit: BoxFit.cover),

    width: double.infinity,
    height: coverHeight,

  );

  Widget buildProfileImage() => CircleAvatar(
    radius: profileHeight / 2,
   backgroundColor: Colors.grey,
    backgroundImage: AssetImage('asset/a.jpg')
  );

}
