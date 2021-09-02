import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pervezbhai/utils/ModelData.dart';

import '../utils/Drawer.dart';
import '../utils/Slider.dart';
import 'cart.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List modelData = Model.getUsers();
  ScrollController _controller = new ScrollController();

  bool _loading = true;

  void _onLoading() {
    setState(() {
      _loading = true;
      new Future.delayed(new Duration(seconds: 3), _login);
    });
    setState(() {
      _loading = false;
    });
  }

  Future _login() async {
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: Icon(Icons.shopping_cart),
            ),
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
             actions:[new IconButton(
               icon: ClipRRect(
                   borderRadius:BorderRadius.circular(20) ,
                   child: Image.asset(
                     "assets/images/smiley-dp.jpg",
                     fit: BoxFit.cover,
                   )),
               onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
             ),] ,
              //leading: Icon(Icons.person),
              title: Image.asset(
                "assets/images/Logo.png",
                height: 50,
              ),
              backgroundColor: Color(0xFFE23030),
            ),
           endDrawer: DrawerFUn(),
            body: SingleChildScrollView(
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 8,
                  decoration: BoxDecoration(
                      color: Color(0xFFE23030), //red colour
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(40))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,

                          contentPadding: EdgeInsets.all(10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(width: 1, color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent)),

                          prefixIcon:

                          IconButton(icon: Icon(Icons.search,color: Colors.black,),
                            onPressed:() {

                            },),
                          suffixIcon: IconButton(icon: Icon(Icons.mic,),
                            onPressed:() {

                            },),
                          hintText: "Search...",
                          hintStyle: new TextStyle(color: Colors.black)),
                    ),
                  ),

                ),
                SizedBox(
                  height: 20,
                ),
                BannerSlider(),
                SizedBox(
                  height: 20,
                ),

                ListView.builder(
                        controller: _controller,
                        itemCount: modelData.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                              child: Card(
                            elevation: 10,
                            // semanticContainer: true,
                            color: Colors.white60,
                            shadowColor: Colors.green,
                            child: ListTile(
                              leading: Image.network(
                                modelData[index].images,
                                fit: BoxFit.cover,
                              ),
                              trailing: Text(modelData[index].price),
                              title: Text(modelData[index].name),
                              subtitle: Text(modelData[index].pname),
                              dense: false,
                              onTap: () {
                                _onLoading();
                                _loading
                                    ? CircularProgressIndicator()
                                    : showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.network(
                                                modelData[index].images,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 50, right: 50),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        modelData[index].pname),
                                                    Text(
                                                        modelData[index].price),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30, right: 30),
                                                child:
                                                    Text(modelData[index].desc),
                                              ),
                                              SizedBox(height: 20),
                                            ],
                                          );
                                        },
                                      );
                              },
                            ),
                          ));
                        },
                      ),
                // CircularProgressIndicator(),
                // SizedBox(
                //   height: 15,
                // ),
                // LinearProgressIndicator(),
              ]),
            )));
  }
}
