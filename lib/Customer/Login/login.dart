import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'OTP_Login.dart';
import 'ForgetPassword.dart';
import '../widget/Customer_Textfield/TextField.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _loading = false;

  void _onLoading() {
    setState(() {
      _loading = true;
      new Future.delayed(new Duration(seconds: 1), _login);
    });
  }
  Future _login() async {
    setState(() {
      _loading = false;
    });
  }

   bool _flag = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xFFE23030),
          ),
          body: SingleChildScrollView(
            child: Container(
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
                        padding: EdgeInsets.only(top: 30),
                        height: MediaQuery.of(context).size.height / 1.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(42))),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  ElevatedButton(
                                      onPressed: () {
                                        _onLoading();
                                        setState(() {
                                          _flag=!_flag;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: _flag ? Colors.blueGrey : Colors.red,

                                        elevation: 6,
                                        shadowColor: Colors.white,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(30.0),
                                        ),
                                      ),
                                      child: Text(' Customer',style: TextStyle(fontSize: 26),)
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        _onLoading();
                                       setState(() {
                                         _flag=!_flag;
                                       });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: _flag ? Colors.red : Colors.blueGrey,
                                        shadowColor: Colors.white,

                                        elevation: 6,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(30.0),
                                        ),
                                      ),
                                      child: Text(' Transporter',style: TextStyle(fontSize: 26),)
                                  ),
                                ],
                              ),
                         _loading?CircularProgressIndicator(): Container(
                            // height: MediaQuery.of(context).size.height,
                            height: 485,
                            child: Field(),
                          ),

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
