
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pervezbhai/Customer/Login/Forget_Password.dart';
import 'package:pervezbhai/Customer/Screens/Account_Page.dart';
import 'package:pervezbhai/Customer/Widget/Buttons.dart';





class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _loading = false;
  bool _flag = true;
  bool isPassword = true;


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
                  Image.asset(
                    "assets/images/Logo.png",
                    height: 180,
                  ),
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
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _onLoading();
                                    setState(() {
                                      _flag = false;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Container(

                                          decoration: BoxDecoration(
                                              color:
                                              !_flag ? Colors.red : Colors.grey,
                                              borderRadius:
                                              BorderRadius.circular(25)),
                                          height: 45,
                                          width: 150,
                                          child: Center(
                                              child: Text(
                                                "Customer",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 23,
                                                    fontWeight: FontWeight.bold),
                                              )))
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _onLoading();
                                    setState(() {
                                      _flag = true;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              color:
                                              _flag ? Colors.red : Colors.grey,
                                              borderRadius:
                                              BorderRadius.circular(25)),
                                          height: 45,
                                          width: 150,
                                          child: Center(
                                              child: Text(
                                                "Transporter",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 23,
                                                    fontWeight: FontWeight.bold),
                                              )))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            if (_flag)
                              _loading?CircularProgressIndicator(): buildContainerCustomer(),
                            if (!_flag) _loading?CircularProgressIndicator():buildContainerTransporter(),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(30)),
                              height: 50,
                              width: 230,
                              child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>_flag? Account():NavBar()));
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28),
                                    ),
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Sign()));
                                    },
                                    child: Text("Forget Password")),
                                Text("|"),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Sign()));
                                    },
                                    child: Text("OTP Login"))
                              ],
                            ),
                            Text(
                              "Login with Email",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
                            Text("Or Sign in with"),
                            SizedBox(height: 10),
                            buildRowIcon(),
                            SizedBox(height: 10),
                            Text(
                              "Dont Have an Account?",
                              style: TextStyle(
                                  color: Colors.red, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Sign()));
                                },
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ))
                          ]),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Row buildRowIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/Group -1.png"),
        SizedBox(
          width: 25,
        ),
        Image.asset("assets/images/Group -2.png"),
        SizedBox(
          width: 25,
        ),
        Image.asset("assets/images/Group 9642.png"),
      ],
    );
  }

  Container buildContainerCustomer() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 35, right: 35),
            child: buildTextFormField(Icons.email, "Transporter Email", false, false),
          ),
          Padding(
            padding: EdgeInsets.only(left: 35, right: 35, top: 10),
            child: buildTextFormField(Icons.lock, "Transporter Password", true, false),
          ),
        ],
      ),
    );
  }

  Container buildContainerTransporter() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 35, right: 35),
            child: buildTextFormField(Icons.email, "Customer Email", false, false),
          ),
          Padding( padding: EdgeInsets.only(left: 35,right: 35,top: 10),
            child: buildTextFormField(
                Icons.lock, "Customer Password", true, false),
          ),
        ],
      ),
    );
  }

  TextFormField buildTextFormField(
      IconData icon, String hintTxt, bool isPassword, bool isEmail) {
    return TextFormField(
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,

      textAlign: TextAlign.center,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        fillColor: Colors.white,
        hintText: hintTxt,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.black12)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.black12)),
        contentPadding: const EdgeInsets.all(8.0),
      ),

      // validator: (kamini) => kamini!.isValidEmail() ? null : "Please enter valid email address",
    );
  }

}
