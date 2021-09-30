import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
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
  String? dropdownValue ;
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
                                  String photo = imageFile!.path;
                                  print('image path save to shared preference    :$photo');
                                  if(
                                  Address.isNotEmpty&&Shipping_Add.isNotEmpty
                                  )
                                    logindata.setBool('logout', false);
                                    logindata.setString('PAddress', Address);
                                    logindata.setString('delevery address', Shipping_Add);
                                    logindata.setString('dilshad', photo);
                                    print(logindata);
                                    // var set= logindata.setString('image',imageB64!);
                                    // print('here we set the path of image$set');


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
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      print("form camera");
      setState(() {
        imageFile = File(pickedFile.path);
        print('Image parth$imageFile');
        // List<int> imageBytes = imageFile!.readAsBytesSync();
        //  imageB64 = base64Encode(imageBytes);
        // Uint8List decoded = base64Decode(imageB64!);
        // print('Image parth$imageB64');
        // print('Dilshad $decoded');
        // print('Image parth $decoded');
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
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
