import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pervezbhai/Customer/Auth/Google_Auth.dart';
import 'package:pervezbhai/Customer/Login/SignUp.dart';
import 'package:pervezbhai/Customer/Screens/Account_Page.dart';
import 'package:pervezbhai/Customer/Widget/Buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Forget_Password.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _loading = false;
  bool _flag = false;
  bool showPassword = false;
  final formKey = GlobalKey<FormState>();

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

  TextEditingController emailcntrl = TextEditingController();
  TextEditingController mobilecntrl = TextEditingController();

  late SharedPreferences logindata;

  late bool newuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();

    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const NavBar()));
    }
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
                              _loading
                                  ? CircularProgressIndicator()
                                  : buildContainerCustomer(),
                            if (!_flag)
                              _loading
                                  ? CircularProgressIndicator()
                                  : buildContainerTransporter(),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap:  ()  {
                                String email = emailcntrl.text;
                                 if (email.isNotEmpty && formKey.currentState!.validate()) {
                                  print('Successful');
                                  logindata.setString('email', email);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>_flag? Account():NavBar()));
                                }
                                 else {
                                   print('unsucess');
                                 }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(30)),
                                height: 50,
                                width: 230,
                                child: Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28),
                                    )),
                              ),
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
                                          builder: (context) => SignUp()));
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

//Google Auth Buttons
  Row buildRowIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/Group -1.png"),
        SizedBox(
          width: 25,
        ),
        InkWell(
          child: Image.asset("assets/images/Group -2.png"),
          onTap: () {
            signInWithGoogle().then((result) {
              if (result != null) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return _flag? Account():NavBar();
                    },
                  ),
                );
              }
            });
          },
        ),
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
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 35, right: 35),
              child: buildTextFormField(
                  Icons.email, "Transporter Email", false, false, emailcntrl),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35, right: 35, top: 10),
              child: buildTextFormField(
                  Icons.lock, "Transporter Password", true, false,mobilecntrl

              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainerTransporter() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 35, right: 35),
              child:
              buildTextFormField(Icons.email, "Customer Email", false, true,emailcntrl),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35, right: 35, top: 10),
              child: buildTextFormField(
                  Icons.lock, "Customer Password", true, false,mobilecntrl),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildTextFormField(
      IconData icon, String hintTxt, bool _isPassword, bool isEmail,TextEditingController controller) {
    return TextFormField(
      obscureText:  _isPassword? showPassword : false,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        suffixIcon: _isPassword?IconButton(
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          icon: Icon(Icons.visibility),
        ):null,
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
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Password";
        }
      },
    );
  }
}
