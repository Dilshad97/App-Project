import 'package:flutter/material.dart';

class SignUpDetails extends StatefulWidget {
  const SignUpDetails({Key? key}) : super(key: key);

  @override
  _SignUpDetailsState createState() => _SignUpDetailsState();
}

class _SignUpDetailsState extends State<SignUpDetails> {
  String? dropdownValue;

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
                                  child: Text("A"),
                                ),
                              )),
                          Positioned(
                            right: -6,
                            bottom: 25,
                            child: IconButton(
                                onPressed: () {},
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
                              buildPaddingDropDownForm("Select Country"),

                              buildPaddingTextField("Current Address"),
                              buildPaddingTextField("Home Address"),
                              buildPaddingDropDownForm("Payments"),

                            ],

                          ),
                        ),
                      ]),
                    ],
                  )),
            )));
  }

  Padding buildPaddingTextField( String txt) {
    return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText:txt,
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


}
