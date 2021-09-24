import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pervezbhai/Customer/Auth/Google_Auth.dart';
import 'package:pervezbhai/Customer/Widget/Drawer.dart';

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
                          radius: 45.0,
                          backgroundImage: NetworkImage(imageUrl),
                          backgroundColor: Colors.transparent,
                        ),
                        Positioned(
                            left: 65,
                            top: 50,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      name,
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
              Column(
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
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Perosnal_Info()));
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
}

// Personal Class

class Perosnal_Info extends StatefulWidget {
  const Perosnal_Info({Key? key}) : super(key: key);

  @override
  _Perosnal_InfoState createState() => _Perosnal_InfoState();
}

class _Perosnal_InfoState extends State<Perosnal_Info> {
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
                      color: Colors.red,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
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

              buildCardDetails( name,"Name",Icons.edit),
              buildCardDetails( email,"Email",Icons.edit),
              buildCardDetails( "XX/XX/XXX","DOB",Icons.edit),
              buildCardDetails( "Mobile","XX876375XX",Icons.edit),
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
