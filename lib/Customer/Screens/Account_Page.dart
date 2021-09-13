import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.yellow,
            leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.red,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(icon: Icon(Icons.help_rounded,color: Colors.red,),

                onPressed: () {
                },
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20,right: 5),
                  child: Text("Support",style: TextStyle(color: Colors.black),))
            ],

          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height/5,
                width: MediaQuery.of(context).size.width,
                color: Colors.yellow,
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Your Name",style: TextStyle(fontSize: 40),),
                      Text("+91 878XXXXX90"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width,
                  color:  Color(0xFF998A8AFF),

                  child:Text("Profile",style: TextStyle(color: Colors.black,fontSize: 17),)
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    CircleAvatar(child: Icon(Icons.email,size: 30,)),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text("Email",style: TextStyle(color: Colors.black54),),
                        Text("abcd@gmail.com"),
                      ], )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    CircleAvatar(child: Icon(Icons.person,size: 30,)),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text("Gender",style: TextStyle(color: Colors.black54),),
                        Text("Male"),
                      ], )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    CircleAvatar(child: Icon(Icons.calendar_today_outlined,size: 30,)),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text("Date of Birth",style: TextStyle(color: Colors.black54),),
                        Text("XX/XX/XXXX"),
                      ], )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    CircleAvatar(child: Icon(Icons.contact_page,size: 30,)),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text("Member Since",style: TextStyle(color: Colors.black54),),
                        Text("Feb 2009"),
                      ], )
                  ],
                ),
              ),

            ],
          ),
        ));
  }
}