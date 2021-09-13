import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';


class BannerSlider extends StatefulWidget {
  const BannerSlider({Key? key}) : super(key: key);

  @override
  _BannerSliderState createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.teal,
      child: CarouselSlider(

        items: [
          Container(
            color: Colors.blueGrey,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,
            child: Image.asset("assets/images/silder1-removebg-preview.png"),


          ),
          Container(
            color: Colors.yellow,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,
            child: Image.asset("assets/images/slider2-removebg-preview.png"),

          ),
          Container(
            color: Colors.amberAccent,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,
            child: Image.asset("assets/images/slider3-removebg-preview.png"),

          ),
          Container(
            color: Colors.white24,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,
            child: Image.asset("assets/images/Slider4-removebg-preview.png"),

          ),
        ],
        options: CarouselOptions(
          height: 180.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}