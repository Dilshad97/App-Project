import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pervezbhai/Customer/Auth/Google_Auth.dart';
import 'package:pervezbhai/Customer/Widget/Drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

@override
class _AccountState extends State<Account> {

  late SharedPreferences logindata;
  File? imageFile;
  String? image;
  String? name;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }


  void initial()async{
    logindata =await SharedPreferences.getInstance();
    setState(() {
      image=logindata.getString('dilshad');
      name= logindata.getString('First_name');


    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.red,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_active_outlined)),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {},
              ),
            ],
          ),
          drawer: DrawerFUn(),
          // bottomNavigationBar: NavBar(),
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage:FileImage(File(image!)),

                          // backgroundImage: NetworkImage(imageUrl),
                          backgroundColor: Colors.transparent,
                        ),
                        Positioned(
                            left: 130,
                            top: 90,
                            child: IconButton(onPressed: () {
                            showModalBottomSheet(context: context, builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(onPressed: () {
                                    GalaryImage();
                                  }, child: Text("Image From Galary")),
                                  TextButton(onPressed: () {
                                    CameraImage();
                                  }, child: Text("Image From Camera")),

                                ],
                              );

                            },);

                            },
                              icon:Icon(Icons.camera_alt_outlined,
                                color: Colors.blue,
                                size: 33,)
                            )

                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '$name',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    InkWell(child: buildCardListile("Personal",Icons.arrow_forward_ios_sharp)
                      ,onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Perosnal_Info()));
                      },
                    ),
                    InkWell(child: buildCardListile("Payments Method ",Icons.arrow_forward_ios_sharp),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Paymets()));
                      },
                    ),
                    InkWell(child: buildCardListile("My Orders",Icons.arrow_forward_ios_sharp),
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Paymets()));
                      },),
                    InkWell(child: buildCardListile("Shipping Address",Icons.arrow_forward_ios_sharp),
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Shipping()));
                      },
                    ),
                    InkWell(child: buildCardListile("Promocodes",Icons.arrow_forward_ios_sharp),
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Perosnal_Info()));
                      },
                    ),
                    buildCardListile("Shipping Address",Icons.arrow_forward_ios_sharp,),
                  ],
                ),
              ),
            ],
          ),
        ));

  }

// List tile Buit function.....
  Card buildCardListile( String tittle, IconData icon,) {
    return Card(
      elevation: 1,
      child: ListTile(
        title:Text(tittle),
        trailing: Icon(icon),
      ),
    );
  }

   GalaryImage() async{
    XFile? pickedfile= await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedfile !=null){
      setState(() {
        imageFile=File(pickedfile.path);
      });
    }

  }

   CameraImage()async {
    XFile? pickedfile=await ImagePicker().pickImage(source: ImageSource.camera);
    if(pickedfile !=null){
      setState(() {
        imageFile=File(pickedfile.path);
      });
    }
  }
}


// Personal Class

class Perosnal_Info extends StatefulWidget {
  const Perosnal_Info({Key? key}) : super(key: key);

  @override
  _Perosnal_InfoState createState() => _Perosnal_InfoState();
}

class _Perosnal_InfoState extends State<Perosnal_Info> {


  late SharedPreferences logindata;
  String ?email;
  String ?First_name;
  String ?Last_name;
  String ?Email;
  String ?Mob_Number;
  String ?Date_of_Birth;
  String ?image;
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
      Mob_Number = logindata.getString('Mob_Number');
      Date_of_Birth = logindata.getString('Date_of_Birth');
      image=logindata.getString('dilshad');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.red,

                      child: Image.file(File(image!)),

                      // child: Image.network(
                      //   imageUrl,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    Positioned(
                        right: 15,
                        top: 10,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.camera_alt_outlined, size: 30)))
                  ],
                ),
              ),

              buildCardDetails( '$First_name $Last_name',"Name",Icons.edit),
              buildCardDetails( '$Email',"Email",Icons.edit),
              buildCardDetails( '$Date_of_Birth',"Date of Birth",Icons.edit),
              buildCardDetails( '$Mob_Number',"Mobile Number",Icons.edit),
              buildCardDetails( "Member since","Feb 2008",Icons.edit),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: Text("Retun to Profile"))
            ],
          ),
        ));
  }

// Build method of profile details
  Card buildCardDetails( String subtitle, String title,IconData icon,) {
    return Card(
      child: ListTile(
        subtitle: Text(
          subtitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        title: Text(
          title,
        ),
        trailing: Icon(icon),
      ),
    );
  }
}

//Payments class
class Paymets extends StatefulWidget {
  const Paymets({Key? key}) : super(key: key);

  @override
  _PaymetsState createState() => _PaymetsState();
}
class _PaymetsState extends State<Paymets> {
  var isVisible = true;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 12,
                    color: Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 22),
                      child: Text(
                        "Choose Your Payment Method..",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    )
                ),
                buildListTilePaymets( "PhonePe",Radio(value: 1, groupValue: val, onChanged: (value) {
                  setState(() {
                    isVisible = !isVisible;
                    val = value as int;
                  });
                },)),
                buildListTilePaymets( "GooglePay",Radio(value: 2, groupValue: val, onChanged: (value) {
                  setState(() {
                    isVisible = !isVisible;
                    val = value as int;
                  });
                },)),
                buildListTilePaymets( "Paytm",Radio(value: 3, groupValue: val, onChanged: (value) {
                  setState(() {
                    isVisible = !isVisible;
                    val = value as int;
                  });
                },)),
                buildListTilePaymets( "Amazon",Radio(value: 4, groupValue: val, onChanged: (value) {
                  setState(() {
                    isVisible = !isVisible;
                    val = value as int;
                  });
                },)),

                ListTile(
                  title: Text("Credit Card"),
                  subtitle:  Visibility(
                    visible: isVisible,
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          width: 300,
                          child:TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.black12)),
                              hintText: "Card Number",

                              contentPadding: const EdgeInsets.all(8.0),

                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 140,
                                child:TextFormField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(color: Colors.black12)),
                                    hintText: "        MM/YY",

                                    contentPadding: const EdgeInsets.all(8.0),

                                  ),
                                ),

                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                height: 40,
                                width: 100,
                                child:TextFormField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(color: Colors.black12)),
                                    hintText: "     CVV",

                                    contentPadding: const EdgeInsets.all(8.0),

                                  ),
                                ),

                              ),

                            ],
                          ),
                        )
                      ],
                    ),

                  ),
                  leading: Radio(
                    value: 5,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        isVisible = !isVisible;
                        val = value as int;
                      });
                    },

                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  title: Text("Debit Card"),
                  subtitle:  Visibility(
                    visible: isVisible,
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          width: 300,
                          child:TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.black12)),
                              hintText: "Card Number",

                              contentPadding: const EdgeInsets.all(8.0),

                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 140,
                                    child:TextFormField(
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: BorderSide(color: Colors.black12)),
                                        hintText: "        MM/YY",

                                        contentPadding: const EdgeInsets.all(8.0),

                                      ),
                                    ),

                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 100,
                                        child:TextFormField(
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(color: Colors.black12)),
                                            hintText: "     CVV",

                                            contentPadding: const EdgeInsets.all(8.0),

                                          ),
                                        ),

                                      ),
                                      Row(
                                        children: [


                                        ],
                                      )
                                    ],
                                  ),

                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),

                  ),
                  leading: Radio(
                    value: 6,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        isVisible = !isVisible;
                        val = value as int;
                      });
                    },

                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red
                    ),
                    onPressed: () {

                    }, child: Text("Make Payment")),
              ],
            ),
          ),
        ));
  }

  //Build method for Payment
  ListTile buildListTilePaymets( String title, Radio radio ) {
    return ListTile(
      title: Text(title),
      subtitle: Visibility(
        visible: isVisible,
        child: TextFormField(
          decoration: InputDecoration(
              hintText: "Upi@PhonePe"
          ),
        ),
      ),
      leading: radio,
      );

  }
}



//Shippind Address

class Shipping extends StatefulWidget {
  const Shipping({Key? key}) : super(key: key);

  @override
  _ShippingState createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {

  late SharedPreferences logindata;
  String ?Address;
  String ?Shipping_Add;
  String ?Zip_code;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      Address = logindata.getString('Address');
      Shipping_Add = logindata.getString('Shipping_Add');
      Zip_code = logindata.getString('Zip_code');

    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height/5,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text('$Address'),
                    Text('$Zip_code'),
                  ],
                ),

              ),
              SizedBox(height: 10,),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height/5,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text('$Shipping_Add')
                  ],
                ),

              ),

            ],
          ),
        ),


      ),
    );
  }
}
