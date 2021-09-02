import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Dashbord/Home_Page.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _FormKey= GlobalKey<FormState>();

  // ScrollController _ctr =ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFE23030),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFE23030),
          child: Column(
            children: [
              Image.asset("assets/images/Logo.png",height: 140),

              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height ,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(42)),
                    ),
                    child: Form(
                      key: _FormKey,
                      child: Column(
                        children: [
                          Text(
                            "SignUp",
                            style: TextStyle(
                                color: Color(0xFFE23030),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 18,
                              left: 23,
                              right: 23,
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: "First Name"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter First Name";
                                };
                              }),

                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 23, right: 23, top: 3),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: "Last Name"),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Last Name";
                                  };
                                }

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 23, right: 23, top: 3),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: "Email"),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Email";
                                  };
                                }
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 23, right: 23, top: 3),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: "Password"),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Password";
                                  };
                                }
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 23, right: 23, top: 3),
                            child:TextFormField(
                              keyboardType: TextInputType.number, // Only numbers can be entere
                              decoration:
                                  InputDecoration(hintText: "Cell Number",

                                  ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Phone Number";
                                  }
                                  else if (value.length >10 ){
                                    return "Please Enter Phone Number Lessthen 10 or 10";
                                  }
                                }
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 23, right: 23, top: 3),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: "Zip code"),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Zip Code";
                                  };
                                }
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                             setState(() {
                               if (_FormKey.currentState!.validate())
                               {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                              }
                             });


                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: 45,
                              width: 220,
                              decoration: BoxDecoration(
                                color: Color(0xFFE23030),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Text(
                                "SIGNUP",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Or Sign Up with",
                            style: TextStyle(color: Colors.black45),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 8, left: 60, right: 60),
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
                            height: 20,
                          ),
                          InkWell(
                            onTap: (){},
                            child: Text(
                              "Already have an account? ",
                              style: TextStyle(
                                  color: Color(0xFFE23030),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 20,),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));

                            },
                            child: Text(
                              "SIGN IN",
                              style: TextStyle(
                                  color: Color(0xFFE23030),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
