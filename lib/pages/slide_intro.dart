import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:human_project_app/service/first_animation.dart';

import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import 'login.dart';





class LiquidSwipeScreen extends StatefulWidget {
  @override
  _LiquidSwipeScreenState createState() => _LiquidSwipeScreenState();
}

class _LiquidSwipeScreenState extends State<LiquidSwipeScreen> {

  static const TextStyle goldcoinGreyStyle = TextStyle(
      color: Colors.grey,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "Montserrat");

  static const TextStyle goldCoinWhiteStyle = TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "Product Sans");

  static const TextStyle greyStyle =
  TextStyle(fontSize: 40.0, color: Colors.grey, fontFamily: "Product Sans");
  static const TextStyle whiteStyle =
  TextStyle(fontSize: 40.0, color: Colors.white, fontFamily: "Product Sans");

  static const TextStyle boldStyle = TextStyle(
    fontSize: 50.0,
    color: Colors.blueGrey,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.bold,
  );

  static const TextStyle descriptionGreyStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontFamily: "Releway",
  );

  static const TextStyle descriptionWhiteStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontFamily: "Product Sans",
  );





  List <Container> pages= [
    Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/img/img10.jpg'),
                  fit: BoxFit.cover
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Row(
           children: <Widget>[
             Expanded(
               flex: 2,
               child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaY: 10,
                          sigmaX: 10
                      ),
                      child: Container(
                        color: Colors.black12,
                      ),
                    ),
                  ),
               ),
               Expanded(
                 flex: 3,
                 child: Container()
                 )
           ], 
          ),
         Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0
                    ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('wema',style: goldcoinGreyStyle)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Online",
                        style: greyStyle,
                      ),
                      Text(
                        "Lisungi",
                        style: boldStyle,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "Aider les autres, c'est\n"
                            "découvrir la veritable \n"
                            "valeur du monde",
                        style: descriptionGreyStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )
    ),
       Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/img/img5.jpg'),
                  fit: BoxFit.cover
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Row(
           children: <Widget>[
             Expanded(
               flex: 2,
               child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaY: 10,
                          sigmaX: 10
                      ),
                      child: Container(
                        color: Colors.black12,
                      ),
                    ),
                  ),
               ),
               Expanded(
                 flex: 3,
                 child: Container()
                 )
           ], 
          ),
         Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0
                    ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('wema',style: goldcoinGreyStyle)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Online",
                        style: greyStyle,
                      ),
                      Text(
                        "Assistance",
                        style: boldStyle,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "Les personnes qui ont les plus\n"
                            "besoin de ton aide sont\n"
                            "celle qui ne te le disent\n"
                            "pas souvent",
                        style: descriptionGreyStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )
    ),
        Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/img/img6.jpg'),
                  fit: BoxFit.cover
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Row(
           children: <Widget>[
             Expanded(
               flex: 2,
               child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaY: 10,
                          sigmaX: 10
                      ),
                      child: Container(
                        color: Colors.black12,
                      ),
                    ),
                  ),
               ),
               Expanded(
                 flex: 3,
                 child: Container()
                 )
           ], 
          ),
         Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0
                    ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('wema',style: goldcoinGreyStyle)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Online",
                        style: greyStyle,
                      ),
                      Text(
                        "Bolamu",
                        style: boldStyle,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "L'argent peut faire le bonheur\n"
                            "s'il sert à aider les autres\n",
                        style: descriptionGreyStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )
    ),

  ];

  int page = 0;
  UpdateType updateType;

  bool button = false;





  @override
  Widget build(BuildContext context) {
    return firstwidgetAnimator(
           Scaffold(
        body: LiquidSwipe(
          pages: pages,
          enableLoop: false,
          fullTransitionValue: 300,
          enableSlideIcon: button ? false : true,
          waveType: WaveType.liquidReveal,
          positionSlideIcon: 0.5,
          initialPage: 0,
          onPageChangeCallback: pageChangeCallback,

        ),

        floatingActionButton: button ?
        FloatingActionButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>
                LoginPage()
            ));
          },
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          child: Icon(Icons.arrow_forward_ios),
        ): Container(),
      )
    );
  }

  void pageChangeCallback(int page) {
    if (page == 2){
      setState(() {
        button = true;
      });
      print('passer');
    }
  }
}