import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectfirst/userpage.dart';
export 'sign_in.dart';
export 'splashscreen.dart';
export 'screen.dart';
export 'register.dart';



class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
 late String isDrawerOpen;

 late File imageFile;
  pickImageFromGallery(ImageSource source)  {
    Future.delayed(Duration.zero,() async {
        imageFile = await ImagePicker().pickImage(source: source) as File;
    });
  }

 Widget showImage() {
   return FutureBuilder<File>(
     builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
       if (snapshot.connectionState == ConnectionState.done &&
        snapshot.data != null) {
         return Image.file(
           snapshot.data!,
           width: 100,
           height: 100,
         );
       }else if (snapshot.error != null) {
         return Text('Error Picking Image',textAlign: TextAlign.center,);
       } else {
         return Text('No Image Selected',textAlign: TextAlign.center,);
       }
     },
   );
 }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.blue[100], //background color of scaffold
        appBar: AppBar(
          title:Text("Profile",style: TextStyle(color: Colors.white,fontSize: 22),), //title of app
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),//background color of app bar
        ),

        drawer: Drawer(

          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader( //header of drawer

                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    'Admin Department ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,

                    ),
                  ),
                ),
              ),
              Container(

                child: ListTile(

                  leading: Icon(Icons.home,color:Colors.grey),

                  title: Text('Home Page',style: TextStyle(color: Colors.black),),
                ),
              ),
              ListTile(
                onTap:()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserPage()));
                },

                leading: Icon(Icons.account_circle),
                title: Text('User Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),

                title: Text('Account Settings'),
              ),
              ListTile(
                  onTap:()
                       {
                         if(scaffoldKey.currentState!.isDrawerOpen){ //check if drawer is open
                           Navigator.pop(context); //context of drawer is different
                         }
                       },

                  leading:Icon(Icons.close),
                  title: Text("Close Drawer")
              )
            ],
          ),
        ),

      body: Container(
        padding: EdgeInsets.only(top: 30),


        decoration: BoxDecoration(
            color: Colors.black,

        ),
        child: Column(
          children: [
            showImage(),
            GestureDetector(
              onTap: () {
                pickImageFromGallery(ImageSource.gallery);
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('asset/kriti.jpg'),
                maxRadius: 30,
                backgroundColor: Colors.green,
              ),
            ),
            SizedBox(height: 10,),
            Text('Flutter Developer',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white),),SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Icon(Icons.location_on,size: 16.0,color: Colors.grey,),
                Text('Pune',style: TextStyle(color: Colors.grey),)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(

                  children: [
                    Text('200',style:TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.white)),
                    Text('Post',style:TextStyle(fontWeight: FontWeight.w400,fontSize: 14.0,color: Colors.grey)),

                  ],
                ), SizedBox(width: 24.0,),
                Column(

                  children: [
                    Text('20.M',style:TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.white)),
                    Text('Followers',style:TextStyle(fontWeight: FontWeight.w400,fontSize: 14.0,color: Colors.grey)),

                  ],
                ), SizedBox(width: 24.0,),
                Column(

                  children: [
                    Text('0',style:TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.white)),
                    Text('Following',style:TextStyle(fontWeight: FontWeight.w400,fontSize: 14.0,color: Colors.grey)),

                  ],
                )
              ],
            ),SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Row(

                children: [
                  Text('About me :',style:TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white)),


                ],
              ), SizedBox(height: 20,),
              Row(

                children: [
                  Text('Name : ',style:TextStyle(fontWeight: FontWeight.w300,fontSize: 16,color: Colors.grey)),
                  Text('Yasmeen Shaikh',style:TextStyle(fontWeight: FontWeight.w300,fontSize: 14.0,color: Colors.grey)),

                ],
              ), SizedBox(height: 10,),
              Row(

                children: [
                  Text('Designation : ',style:TextStyle(fontWeight: FontWeight.w300,fontSize: 16,color: Colors.grey)),
                  Text(' Application devloper',style:TextStyle(fontWeight: FontWeight.w300,fontSize: 14.0,color: Colors.grey)),

                ],
              ),SizedBox(height: 10,),
              Row(

                children: [
                  Text('Address : ',style:TextStyle(fontWeight: FontWeight.w300,fontSize: 16,color: Colors.grey)),
                  Text('Midc Road Pune, maharastra ',style:TextStyle(fontWeight: FontWeight.w300,fontSize: 14.0,color: Colors.grey)),
                ],
              ),SizedBox(height: 10,),
              Row(

                children: [
                  Text('Contact : ',style:TextStyle(fontWeight: FontWeight.w300,fontSize: 16,color: Colors.grey)),
                  Text('88552244755 ',style:TextStyle(fontWeight: FontWeight.w300,fontSize: 14.0,color: Colors.grey)),
                ],
              )
              ,SizedBox(height: 10,),
              Row(

                children: [
                  Text('Email : ',style:TextStyle(fontWeight: FontWeight.w300,fontSize: 16,color: Colors.grey)),
                  Text('Yasmeenshaikh755@gmail.com ',style:TextStyle(fontWeight: FontWeight.w300,fontSize: 14.0,color: Colors.grey)),
                ],
              )
              ,SizedBox(height: 10,),
              Row(

                children: [
                  Text('Company Name : ',style:TextStyle(fontWeight: FontWeight.w300,fontSize: 16,color: Colors.grey)),
                  Text('Tata consultancy',style:TextStyle(fontWeight: FontWeight.w300,fontSize: 14.0,color: Colors.grey)),
                ],
              ),SizedBox(height: 30,),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10)

              ),
              child: Row(
                children: [
                  Image.asset('asset/tcs3.jpg',height: 50,width: 300,),
                  ],
              ),

            )
          ],
        ),
            ),










      //       Container(
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Row(
      //         children: [
      //         Text('About Me :',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
      //           SizedBox(height: 10,),
      //         Row(
      //           children: [
      //           Text('Name : Yasmeen Shaikh',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),)
      //           ],
      //         )
      //         ],
      //       )
      //     ],
      //
      //           // children: [
      //           //   Text('About Me :',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
      //           //   ),SizedBox(height: 10,),
      //           //   Text('Name : Yasmeen Shaikh',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),
      //           //   ),SizedBox(height: 10,),
      //           //   Text('Designation : Application\n                              Devloper',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),
      //           //   ),SizedBox(height: 10,),
      //           //   Text('Contact No : 88554466522',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),
      //           //   )
      //           //   ,SizedBox(height: 10,),
      //           //   Text('Address : Midc road,\n                      pune,maharastra\n                      Pincode 411012',style:
      //           //   TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),)],
      //         ),
      //       )
      //     ],
      //   ),
      // ),

    ]
    )));
  }
}
