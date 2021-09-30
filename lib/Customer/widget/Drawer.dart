

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pervezbhai/Customer/Login/Login.dart';
import 'package:pervezbhai/Customer/Screens/Account_Page.dart';
import 'package:pervezbhai/Customer/Screens/Cart_Page.dart';
import 'package:pervezbhai/Customer/Auth/Google_Auth.dart';
import 'package:pervezbhai/Customer/Screens/Home_Page.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerFUn extends StatefulWidget {
  const DrawerFUn({Key? key}) : super(key: key);

  @override
  _DrawerFUnState createState() => _DrawerFUnState();
}

class _DrawerFUnState extends State<DrawerFUn> {

  late SharedPreferences logindata;
  String ?email;
  String ?First_name;
  String ?Last_name;
  String ?Email;
  String ?img;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();

  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      email = logindata.getString('email');
      Email = logindata.getString('Email');
      First_name = logindata.getString('First_name');
      Last_name = logindata.getString('Last_name');
      print(Last_name);
      img=logindata.getString('dilshad');
      print('file path get to shared preference :  $img');

       // String? imagess = logindata.getString("image");
       // print('imagess $imagess');


    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Account()));
              },
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFE23030),
                  // image: DecorationImage(image: NetworkImage(imageUrl,))
                ),
                accountName: Text( '$First_name $Last_name',style:TextStyle(fontSize: 20)),
                accountEmail: Text('$Email'),
                currentAccountPicture: CircleAvatar(
                   backgroundImage:FileImage(File(img!)),
                  // child: Image.file(File(img!)),

                  radius: 100.0,

                )

              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
              },
              child: ListTile(

                leading: Icon(Icons.car_rental),

                title: Text("Your Order"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));

              },
              child: ListTile(
                leading: Icon(Icons.shopping_cart),

               title: Text("Buy Again"),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: ListTile(
                leading: Icon(Icons.message),

                title: Text("Your Wishlist"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Account()));

              }
              ,
              child: ListTile(
                leading: Icon(Icons.person),

                title: Text("Your Account"),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: ListTile(
                leading: Icon(Icons.settings),

                title: Text("Setting"
                    ""),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                color: Colors.black,
              ),
              title: Text("Share with Friends"),
              onTap: () {
                Share.share('check out my website https://example.com',
                    subject: 'Look what I made!');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text("Logout"),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return Login();}), ModalRoute.withName('/'));

              },
            ),




          ],
        ),

      ),





    );
  }
}