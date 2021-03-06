import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pervezbhai/Dashbord/Home_Page.dart';
import 'package:pervezbhai/Dashbord/account.dart';
import 'package:share/share.dart';


import '../Dashbord/cart.dart';

class DrawerFUn extends StatefulWidget {
  const DrawerFUn({Key? key}) : super(key: key);

  @override
  _DrawerFUnState createState() => _DrawerFUnState();
}

class _DrawerFUnState extends State<DrawerFUn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(

          child: ListView(

            children: [
              UserAccountsDrawerHeader(

                decoration: BoxDecoration(
                  color: Color(0xFFE23030),
                ),
                accountName: Text("Dilshad Alam"),
                accountEmail: Text("rayeendilshan@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  child: Text(
                    "D",
                    style: TextStyle(fontSize: 40),
                  ),
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




            ],
          ),

        ),





    );
  }
}
