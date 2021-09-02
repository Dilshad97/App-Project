import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pervezbhai/auth/Sign_Up.dart';

import '../utils/Buttom_Nav_Bar.dart';
import 'OTP_Login.dart';
import 'ForgetPassword.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isobscure = true;

  final _formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFE23030),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          //padding: EdgeInsets.only(top: 100),
          color: Color(0xFFE23030),
          child: Column(
            children: [
             Image.asset("assets/images/Logo.png",height: 180,),
              SizedBox(
                height: 34,
              ),
              Column(
                children: [
                  Container(
                     padding: EdgeInsets.all(30),
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(42))),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "Log In",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFFE23030),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          Form(
                            key:_formkey ,
                            child: Column(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 50, right: 50),
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      hintText: "Email",
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide:
                                          BorderSide(color: Colors.black12)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50),
                                          borderSide:
                                          BorderSide(color: Colors.black12)),
                                      contentPadding: const EdgeInsets.all(8.0),
                                    ),

                                validator: (kamini) => kamini!.isValidEmail() ? null : "Please enter valid email address",

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 50, right: 50),
                                  child: TextFormField(
                                      textAlign: TextAlign.center,
                                      obscureText: _isobscure,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(40),
                                              borderSide:
                                              BorderSide(color: Colors.black12)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(40),
                                              borderSide:
                                              BorderSide(color: Colors.black12)),
                                          hintText: "            Password",
                                          suffixIcon: IconButton(
                                            icon: Image.asset(
                                                "assets/images/Eye Active.png"),
                                            onPressed: () {
                                              setState(() {
                                                _isobscure = !_isobscure;
                                              });
                                            },
                                          ),
                                          contentPadding: EdgeInsets.all(8)),
                                    // validator: (value) {
                                    //   if (value!.isEmpty ) {
                                    //     return " Password Should not be blank";
                                    //   }
                                    //   else if(value.length<8){
                                    //     return "Passwords must be at least 8 ";
                                    //   }
                                    //   else{
                                    //      value.isValidPassword() ? null : "Please enter valid Password";
                                    //   }
                                    //
                                    //   }
                                   validator: (input) => input!.isValidPassword() ? null : "Please enter valid Password",

                                  ),
                                ),

                              ],

                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: ()
                            {
                             setState(() {
                              if (_formkey.currentState!.validate()) {
                                 Navigator.push(context,MaterialPageRoute(builder: (context) =>NavBar()));
                                 print(' success');

                              }
                              else {
                                print(' unsuccess');
                              }
                             });
                            },
                            child: Container(
                              height: 50,
                              width: 260,
                              padding: EdgeInsets.only(top: 11),
                              decoration: BoxDecoration(
                                  color: Color(0xFFE23030),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Text(
                                "SIGN IN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign()));
                                },
                                child: Text(
                                  "Forget Password",
                                  style: TextStyle(
                                      color: Color(0xFF1460AD),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                " |",
                                style: TextStyle(
                                    color: Color(0xFF1460AD),
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Otp()));
                                },
                                child: Text(
                                  " OTP LOGIN",
                                  style: TextStyle(
                                      color: Color(0xFF1460AD),
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Login with Email",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Or Sign In with",
                            style: TextStyle(color: Colors.black45),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 10, left: 50, right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                        "assets/images/Group -1.png")),
                                InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                        "assets/images/Group -2.png")),
                                InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                        "assets/images/Group 9642.png"))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),

                          Text("Don't have an account ?",
                              style: TextStyle(
                                color: Color(0xFFE23030),
                                fontWeight: FontWeight.bold,
                              )),


                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: Text("SIGN UP",
                                  style: TextStyle(
                                      color: Color(0xFFE23030),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}


extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
extension PasswordValidator on String {
  bool isValidPassword() {
    return RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
    .hasMatch(this);
  }
}

