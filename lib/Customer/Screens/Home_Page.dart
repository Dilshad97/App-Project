import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pervezbhai/Customer/Model/Model.dart';
import 'package:pervezbhai/Customer/Widget/Drawer.dart';
import 'package:pervezbhai/Customer/Widget/Slider_Adv.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List modelData = Model.getUsers();
  ScrollController _controller = new ScrollController();
  bool _loading = false;

  int increment =0;
  void add(){
    setState(() {
      increment ++;
    });
  }

  void minus(){
    setState(() {
      if (increment != 0) increment--;
    });
  }

  void _onLoading() {
    setState(() {
      _loading = true;
      new Future.delayed(new Duration(seconds: 3), _login);
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
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Cart()));
                _onLoading();
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
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: new IconButton(
                    icon: Icon(Icons.account_circle,size: 50,),
                    onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
                  ),
                ),
              ],
              //leading: Icon(Icons.person),
              title: Image.asset(
                "assets/images/Logo.png",
                height: 50,
              ),
              backgroundColor: Color(0xFFE23030),
            ),
            endDrawer: DrawerFUn(),
            body: _loading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 8,
                  decoration: BoxDecoration(
                      color: Color(0xFFE23030), //red colour
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(40))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 1, color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent)),
                          prefixIcon: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.mic,
                            ),
                            onPressed: () {},
                          ),
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

                buildListView(),
              ]),
            )));
  }

  ListView buildListView() {
    return ListView.builder(
                controller: _controller,
                itemCount: modelData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      elevation: 6,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                modelData[index].pname,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(modelData[index].name,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Container(
                                  width: 250,
                                  child: Text(modelData[index].desc,
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 14,
                                          fontWeight:
                                          FontWeight.bold))),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(modelData[index].price,
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 20,
                                          fontWeight:
                                          FontWeight.bold))),
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  buildShowModalBottomSheet(context, index);
                                } ,
                                child: Container(
                                    color: Colors.white30,
                                    height: 100,
                                    width: 100,
                                    child: Image.network(
                                      modelData[index].images,
                                    )),
                              ),

                              Container(
                                width: 90,
                                height: 40,
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.red),
                                child: Row(
                                  children: [
                                    InkWell(
                                        onTap: minus,
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 22,
                                        )),
                                    SizedBox(width: 5,),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 3),
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          color: Colors.white),
                                      child: Text(
                                        " $increment",
                                        style: TextStyle(color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(width: 5,),

                                    InkWell(
                                        onTap:add,
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 22,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context, int index) {
    return showModalBottomSheet(
                                    context: context,
                                    builder: (context){
                                      return Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.network(
                                            modelData[index].images,),
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
                                            height: 20,),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30, right: 30),
                                            child:
                                            Text(modelData[index].desc),
                                          ),
                                          SizedBox(height: 10),

                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.red
                                              ),
                                              onPressed: () {

                                              }, child: Text("Checkout")),
                                          SizedBox(height: 10),

                                        ],
                                      );
                                    }
                                );
  }
}
