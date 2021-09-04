import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pervezbhai/utils/ModelData.dart';

import '../utils/Drawer.dart';
import '../utils/Slider.dart';

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
  void initState() {
    // TODO: implement initState

    super.initState();
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
                new IconButton(
                  icon: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/smiley-dp.jpg",
                        fit: BoxFit.cover,
                      )),
                  onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
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

                      ListView.builder(
                        controller: _controller,
                        itemCount: modelData.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: InkWell(

                              onTap: ()
                              {
                                showModalBottomSheet(
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
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                              modelData[index].pname,style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold),),
                                          Text(
                                              modelData[index].name,style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),),
                                          Text(
                                              modelData[index].price,style: TextStyle(
                                              color: Colors.redAccent,
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold),),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30, right: 30),
                                            child:
                                            Text(modelData[index].desc,style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),),
                                          ),
                                          ElevatedButton(style: ElevatedButton.styleFrom(
                                            primary: Colors.red
                                          ),

                                              onPressed: ()
                                          {

                                          }, child: Text("Checkout"))
                                        ],
                                      ),

                                      SizedBox(height: 20),
                                    ],
                                  );
                                },);
                              },
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
                                        Container(
                                            color: Colors.white30,
                                            height: 100,
                                            width: 100,
                                            child: Image.network(
                                              modelData[index].images,
                                            )),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.red
                                          ),
                                          onPressed: () {},
                                          child: Text("Add to cart"),
                                        ),
                                        SizedBox(height: 10,)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
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
