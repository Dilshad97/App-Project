import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  bool _isobscure = true;
  final _FormKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
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
                  Image.asset("assets/images/Logo.png",height: 140),
                  Container(
                    width: 100,
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(42))),
                        child: Column(
                          children: [
                            Text(
                              "OTP Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                // color: Color(0xFFE23030),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 50, right: 50,bottom: 20),
                              child: Form(
                                key: _FormKey,
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(

                                    fillColor: Colors.white,
                                    hintText: "Enter Your Cell Number",
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide:
                                        BorderSide(color: Colors.black12)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide:
                                        BorderSide(color: Colors.black12)

                                    ),
                                    contentPadding: const EdgeInsets.all(8.0),
                                  ),

                                  validator:  (value) {
                                    if (value!.isEmpty) {
                                      return "Cell Number should not be blank";
                                    }
                                    else if (value.length >10 ){
                                      return "Please Enter Phone Number Lessthen 10 or 10";
                                    }
                                  },
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if(_FormKey.currentState!.validate()){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Otp()));
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
                                  "Send OTP",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),



                          ],
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