import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pervezbhai/Customer/Login/Login.dart';
import 'package:pervezbhai/Customer/Login/SignUpDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _FormKey= GlobalKey<FormState>();

  bool _loading = false;

  void _onLoading() {
    setState(() {
      _loading = true;
      new Future.delayed(new Duration(seconds: 3), _login);
    });
  }

  Future _login() async {
    setState(() {
      _loading = false;
    });
  }
  TextEditingController FName = TextEditingController();
  TextEditingController Lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cnfmpassword = TextEditingController();
  TextEditingController mNumber = TextEditingController();
  TextEditingController zipcode = TextEditingController();
  TextEditingController dob = TextEditingController();

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
          context, MaterialPageRoute(builder: (context) => const SignUpDetails()));
    }



  }






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
                              padding: const EdgeInsets.only( left: 23, right: 23, top: 3),
                              child: Form(
                                key: _FormKey,
                                child: Column(
                                  children: [
                                    buildTextFormField("First Name",FName),
                                    buildTextFormField("Last Name",Lname),
                                    buildTextFormField("Dob",dob),
                                    buildTextFormField("First Email",email),
                                    buildTextFormField("First Password",password),
                                    buildTextFormField("First Confirm Password",cnfmpassword),
                                    buildTextFormField("First Phone Numbber",mNumber),
                                    buildTextFormField("First Zip Code",zipcode),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                _onLoading();
                                setState(()
                                  // if (_FormKey.currentState!.validate())
                                  {
                                    String First_name = FName.text;
                                    String Last_name = Lname.text;
                                    String Email = email.text;
                                    String Mob_Number = mNumber.text;
                                    String Zip_code = zipcode.text;
                                    String Date_of_Birth = dob.text;

                                    if(First_name.isNotEmpty && Date_of_Birth.isNotEmpty&&Last_name.isNotEmpty && Email.isNotEmpty&&Mob_Number.isNotEmpty&&Zip_code.isNotEmpty){
                                      print("Success");
                                      logindata.setBool("logout", false);
                                      logindata.setString('First_name', First_name);
                                      logindata.setString('Last_name', Last_name);
                                      logindata.setString('Email', Email);
                                      logindata.setString('Mob_Number', Mob_Number);
                                      logindata.setString('Zip_code', Zip_code);
                                      logindata.setString('Date_of_Birth', Date_of_Birth);
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpDetails()));
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
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  TextFormField buildTextFormField( String hint ,TextEditingController controller) {
    return TextFormField(
        controller:controller,
        decoration: InputDecoration(
            hintText: hint
        ),
        validator: (value) {
          if (value!.isEmpty)
          {
            return "Please Enter First Name";
          };
        });
  }
}


