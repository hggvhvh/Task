import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectfirst/register.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPasswordVisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Image(
          image: AssetImage('asset/bimg.jpg'),
        )),
      ),
    body: SingleChildScrollView(
      child: SafeArea(child:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        child:
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
   mainAxisAlignment: MainAxisAlignment.center,
   children: [
               Text('Welcome Back',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w700)),
                SizedBox(height: 10,),
                Text("you' ve been Missed!",style: TextStyle(color: Colors.white,fontSize: 20)
                ),SizedBox(height: 100,),
       Padding(
               padding: const EdgeInsets.symmetric(vertical: 10),
               child: TextFormField(
                 controller: emailController,
                 validator: (value) {
                   if (value == "") {
                     return "This is required.";
                   }
                 },
                 style: TextStyle(color: Colors.white),
                 keyboardType: TextInputType.text,
                 textInputAction: TextInputAction.next,
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.all(20),
                   hintText: 'Phone, email and username',
                   hintStyle: TextStyle(color: Colors.grey),
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                       color: Colors.grey,width: 1
                     ),borderRadius: BorderRadius.circular(18)
                   ),
                     focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                 color: Colors.white,width: 1
                 ),borderRadius: BorderRadius.circular(18)
               )
                 ),
               ),
       ),SizedBox(height: 30,),



              TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == "") {
                    return "This is required.";
                  }
                },
                style: TextStyle(color: Colors.white),
              obscureText: isPasswordVisible,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
               suffixIcon: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                 child: IconButton(
                     onPressed: () {
                     setState(() {
                       isPasswordVisible = !isPasswordVisible;
                     });
                     },
                     icon: Icon(
                            isPasswordVisible
                           ? Icons.visibility_off
                            : Icons.visibility,
                            color: Colors.grey,)
                 ),
               ),
                // suffixIcon: const Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20),
                //   child: IconButton( onPressed: () {},
                //       icon:  Icon(Icons.visibility,color: Colors.grey,)
                //   ),
                // ),
                  contentPadding: EdgeInsets.all(20),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey,width: 1
                      ),borderRadius: BorderRadius.circular(18)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white,width: 1
                      ),borderRadius: BorderRadius.circular(18)
                  )
              ),


              ),SizedBox(height:50,),
     Container(
       width: MediaQuery.of(context).size.width,
       alignment: Alignment.center,
       child: ElevatedButton(
           onPressed: () async {
             if (formKey.currentState!.validate()) {

                   String email = emailController.text;
                   String pass = passwordController.text;
                   var response = await dio.post(
                     'https://cupidknot.kuldip.dev/api/login',
                     data: {
                   'username' : email,
                   'password' : pass,
                   }
                     ,options: Options(
                       followRedirects: false,
                       validateStatus: (status) { return status! < 500; }
                   ),);
                   if(response!=null){
                     print(response);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                   }
                   //Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()))
             }
           },
           child: Text("Submit",
                 style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.w500,
                     backgroundColor: Colors.transparent))),
     ),
     SizedBox(height: 80,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Dont't have an account ? ",style: TextStyle(color: Colors.grey),
                     ),
                     GestureDetector(onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                     }, child: Text('Register',style: TextStyle(color: Colors.white))
                     // Text("Register ",style: TextStyle(color: Colors.white),
                     // )
                     )],
                 ),



              ],
              ),
            ),

        ),

      )),
    );

  }
}


