import 'package:flutter/material.dart';
import 'package:projectfirst/userdetails.dart';
export 'sign_in.dart';
export 'splashscreen.dart';
export 'screen.dart';
export 'register.dart';
export 'profile.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('User Department',style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
             children: [
            //   CircleAvatar(
            //     backgroundImage: AssetImage('asset/kriti.jpg',),
            //     maxRadius: 25,
            //     backgroundColor: Colors.green,
            //
            //   ),
            //   Column(
            //       children: [ Text('Developer Imposter Syndrome',style: TextStyle(color: Colors.white),
            //   ),Text('Tijan Ayomide - Oct 19',style: TextStyle(color: Colors.grey))
            //   ]
            //   SizedBox(height: 20,),
              Row(

                children: [

                 CircleAvatar(
                    backgroundImage: AssetImage('asset/a.jpg',),
                    maxRadius: 25,
                    backgroundColor: Colors.green,

                  ),SizedBox(width: 30,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetails()));
                    },
                    child: Column(

                        children: [ Text('Developer Imposter Syndrome',style: TextStyle(color: Colors.white),
                        ),Text('Tijan Ayomide - Oct 19',style: TextStyle(color: Colors.grey))
                        ]
                    ),
                  )
                ],
              ),SizedBox(height: 35,),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('asset/b.jpg',),
                    maxRadius: 25,
                    backgroundColor: Colors.green,

                  ),SizedBox(width: 30,),
                  Column(
                      children: [ Text('Flutter Developer',style: TextStyle(color: Colors.white),
                      ),Text('   Joy Zen - Mar 19',style: TextStyle(color: Colors.grey))
                      ]
                  )
                ],
              ),SizedBox(height: 35,),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('asset/f.jpg',),
                    maxRadius: 25,
                    backgroundColor: Colors.green,

                  ),SizedBox(width: 30,),
                  Column(
                      children: [ Text('Deadly sins Of Programming',style: TextStyle(color: Colors.white),
                      ),Text('Aimen Zairi - Nov 5',style: TextStyle(color: Colors.grey))
                      ]
                  )
                ],
              ),SizedBox(height: 35,),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('asset/c.jpeg',),
                    maxRadius: 25,
                    backgroundColor: Colors.green,

                  ),SizedBox(width: 30,),
                  Column(
                      children: [ Text('Blog Angular and firebase',style: TextStyle(color: Colors.white),
                      ),Text('  Jonathan Gamble - Nov 6',style: TextStyle(color: Colors.grey))
                      ]
                  )
                ],
              ),SizedBox(height: 35,),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('asset/d.jpg',),
                    maxRadius: 25,
                    backgroundColor: Colors.green,

                  ),SizedBox(width: 30,),
                  Column(
                      children: [ Text('Oop In Real Life!!',style: TextStyle(color: Colors.white),
                      ),Text('Danish Saleem - Jun 05',style: TextStyle(color: Colors.grey))
                      ]
                  )
                ],
              ),SizedBox(height: 35,),
               Row(
                 children: [
                   CircleAvatar(
                     backgroundImage: AssetImage('asset/e.jpg',),
                     maxRadius: 25,
                     backgroundColor: Colors.green,

                   ),SizedBox(width: 30,),
                   Column(
                       children: [ Text('Ubuntu Installation',style: TextStyle(color: Colors.white),
                       ),Text('Purnima Sharma - Oct 20',style: TextStyle(color: Colors.grey))
                       ]
                   )
                 ],
               )
            ],
          ),

        ),
      ),
    );
  }
}
