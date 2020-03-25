import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:human_project_app/pages/slide_intro.dart';
import 'package:human_project_app/service/first_animation.dart';
import 'package:human_project_app/widgets/animation_loader.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 10),()=>
        Navigator.pushReplacement(context, PageTransition(child: LiquidSwipeScreen(),type: PageTransitionType.rightToLeftWithFade)
        ));
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
               image: DecorationImage(
                    image: AssetImage('Assets/intro1.jpg'),
                    fit: BoxFit.cover
                )
            ),
      child: Stack(
          children:<Widget>[
              Container(
                 // width: MediaQuery.of(context).size.width/2,
                  child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaY: 10,
                          sigmaX: 10
                      ),
                      child: Container(
                        color: Colors.white10,
                      ),
                    ),
                ),
             
              Center(
                child: Container(
                  height: 300,
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 100,
                          child: firstwidgetAnimator(
                             Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                color: Colors.white
                              ),
                              child: 
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left:8.0,top: 60,right: 18.0),
                                        child: Column(
                                          children: <Widget>[
                                            firstwidgetAnimator(
                                                  Text('wema',
                                                 style: TextStyle(
                                                   decoration: TextDecoration.none,
                                                   color:Colors.black,
                                                   fontSize: 35,
                                                   fontFamily: 'Montserrat'
                                                   )),
                                            ),
                                                 Padding(
                                                   padding: const EdgeInsets.only(right: 70),
                                                   child: Container(
                                                     height: 2,
                                                     decoration: BoxDecoration(
                                                       color: Colors.black
                                                     ),
                                                   ),
                                                 ),

                                                 Padding(
                                                   padding: const EdgeInsets.only(right: 40),
                                                   child: Text('from zipbox',
                                               textAlign: TextAlign.center,
                                               style: TextStyle(
                                                   fontSize: 14,
                                                   fontFamily: 'Releway',
                                                   decoration: TextDecoration.none,
                                                   color:Colors.black
                                                   )),
                                                 ),

                                          ],
                                        ),
                                      ),
                            ),
                          ),
                        ),
                         Positioned(
                           top: 15,
                           right: 110,
                           child: Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 5,
                                color: Colors.black
                              )
                            ),
                        ),
                         ),
                         
                      ],
                    )
                  )
                  )
              ),
              Positioned(
                bottom: 140,
                left: 0,
                right: 0,
                child: Center(
                child:  Text('Technology\nno limit',
                                             textAlign: TextAlign.center,
                                             style: TextStyle(
                                               fontSize: 15,
                                               fontFamily: 'Releway',
                                               decoration: TextDecoration.none,
                                               color:Colors.white
                                               )),
              )),
              Positioned(
                           bottom: 30,
                           left: 0,
                           right: 0,
                           child: Center(
                            child: LoaderAnimation(),
                          )
                           )
          ]
      ),
      
    );
  }
}