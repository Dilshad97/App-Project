import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sign extends StatefulWidget {
  const Sign({Key? key}) : super(key: key);

  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  String dropdownValue = '+91';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFE23030),
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Color(0xFFE23030),
              child: Column(
                children: [
                  Image.asset("assets/images/Logo.png", height: 140),
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Text(
                                "Reser Your Password...",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  // color: Color(0xFFE23030),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, left: 50, right: 50, bottom: 20),
                                child: Container(
                                  height: 48,width: 250,
                                  child: TextFormField(
                                      keyboardType: TextInputType.phone,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        prefixIcon:
                                        DropdownButton<String>(
                                          value: dropdownValue,
                                          style: const TextStyle(color: Colors.blue),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownValue = newValue!;
                                            });
                                          },
                                          items: <String>["+91",'+971','999','243','+004']
                                              .map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value,style: TextStyle(color: Colors.blue),),
                                            );
                                          }).toList(),
                                        ),

                                        fillColor: Colors.white,
                                        hintText: "Enter Your Cell Number +",
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(40),
                                            borderSide:
                                            BorderSide(color: Colors.black12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(40),
                                            borderSide:
                                            BorderSide(color: Colors.black12)),
                                        contentPadding: const EdgeInsets.all(8.0),
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
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Divider(thickness: 2,)
                                  ),
                                  Text(" OR "),
                                  Expanded(
                                      child: Divider(thickness: 2,))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 50, right: 50),
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email),
                                    fillColor: Colors.white,
                                    hintText: "Enter Your Email",
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
                                  validator: (input) => input!.ValidEmail()
                                      ? null
                                      : "Please enter valid email address",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Sign()));
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
  bool ValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}