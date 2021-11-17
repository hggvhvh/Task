import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectfirst/profile.dart';
import 'package:projectfirst/sign_in.dart';
export 'sign_in.dart';
export 'splashscreen.dart';
export 'screen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isPasswordVisible = true;
  DateTime selectedDate = DateTime.now();
  String birthDate = "Select Date";
  TextEditingController nameController = TextEditingController();
  TextEditingController name2Controller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image(
                image: AssetImage('asset/bimg.jpg'),
              ))),
      body: SafeArea(
          child: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Create new account to get started.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value == "") {
                              return "This is required.";
                            }
                          },
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              hintText: 'Name',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(18)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(18))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: name2Controller,
                          validator: (value) {
                            if (value == "") {
                              return "This is required.";
                            }
                          },
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              hintText: 'Last Name',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(18)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(18))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: emailController,
                          validator: (value) {
                            if (value == "") {
                              return "This is required.";
                            }
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              hintText: 'Email Id',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(18)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(18))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: mobileController,
                          validator: (value) {
                            if (value!.length != 10) {
                              return "minimum 10 digits";
                            }
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              hintText: 'Phone No',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(18)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(18))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                      color: Colors.grey,
                                    )),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(18)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(18))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(

                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            onPressed: () => _selectDate(context),
                            // Refer step 3
                            child: Text(
                              birthDate,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,),
                            ),
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account ? ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignInPage()));
                                },
                                child: Text('Sign In',
                                    style: TextStyle(color: Colors.white))
                                // Text("Register ",style: TextStyle(color: Colors.white),
                                // )
                                )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(

                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                if (birthDate == "Select Date") {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Please Select Date !")));
                                } else {
                                  String name = nameController.text;
                                  String name2 = name2Controller.text;
                                  String email = nameController.text;
                                  String mobile = nameController.text;
                                  String password = nameController.text;
                                  var response = await dio.post(
                                      'https://cupidknot.kuldip.dev/api/register',
                                      data: {
                                        'first_name': name,
                                        'last_name': name2,
                                        'email': email,
                                        'password': password,
                                        'password_confirmation': password,
                                        'birth_date': birthDate,
                                        'gender': 'MALE',
                                      },options: Options(
                                      followRedirects: false,
                                      validateStatus: (status) { return status! < 500; }
                                  ),);
                                  if(response!=null){
                                    print(response);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                                  }
                                }
                              }
                            },
                            child: Text("Submit",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    backgroundColor: Colors.transparent))),
                        ElevatedButton(
                            onPressed: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                            },
                            child: Text("Check Profile Page",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    backgroundColor: Colors.transparent)))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ])),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        DateFormat dateFormat = DateFormat("dd-MMM-yyyy");
        birthDate = dateFormat.format(DateTime.now());
      });
  }
}
