import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pervezbhai/Customer/Widget/Buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpDetails extends StatefulWidget {
  const SignUpDetails({Key? key}) : super(key: key);

  @override
  _SignUpDetailsState createState() => _SignUpDetailsState();
}

class _SignUpDetailsState extends State<SignUpDetails> {
  File? imageFile;
  String? dropdownValue;
  TextEditingController addresscntrl = TextEditingController();
  TextEditingController shippingaddrsscntrl = TextEditingController();

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
              backgroundColor: Color(0xFFE23030),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFFE23030),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 4.5,
                              child: CircleAvatar(
                                radius: 68,
                                child: Center(
                                  child: imageFile == null
                                      ? Text("A")
                                      : CircleAvatar(
                                          radius: 68,
                                          backgroundImage: FileImage(
                                            imageFile!,
                                          ),
                                        ),
                                ),
                              )),
                          Positioned(
                            right: -6,
                            bottom: 25,
                            child: IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            onTap: () {
                                              _getFromCamera();
                                            },
                                            trailing: Icon(Icons.camera_alt),
                                            title: Text("Image From Camera"),
                                          ),
                                          ListTile(
                                            onTap: () {
                                              _getFromGallery();
                                            },
                                            trailing: Icon(Icons.image),
                                            title: Text("Image From Gallary"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: Icon(
                                  Icons.camera_alt,
                                  size: 30,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                      Column(children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(42)),
                          ),
                          child: Column(
                            children: [
                              buildPaddingDropDownForm("Select Country"),
                              buildPaddingTextField("Current Address",addresscntrl),
                              buildPaddingTextField("Home Address",shippingaddrsscntrl),
                              buildPaddingDropDownForm("Payments"),
                              ElevatedButton(
                                onPressed: () {
                                  String Address = addresscntrl.text;
                                  String Shipping_Add = shippingaddrsscntrl.text;
                                  if(
                                  Address.isNotEmpty&&Shipping_Add.isNotEmpty
                                  )
                                    logindata.setString(Address, Address);
                                    logindata.setString(Shipping_Add, Shipping_Add);

                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NavBar()));
                                },
                                child: Text("Next"),
                              )
                            ],
                          ),
                        ),
                      ]),
                    ],
                  )),
            )));
  }

  Padding buildPaddingTextField(String txt,TextEditingController conltroller) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: conltroller,
        decoration: InputDecoration(
          labelText: txt,
        ),
      ),
    );
  }

  Padding buildPaddingDropDownForm(String hint) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButtonFormField(
        value: dropdownValue,
        hint: Text(hint),
        icon: const Icon(Icons.arrow_drop_down),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['Red', 'Green', 'Blue']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
