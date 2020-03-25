import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:human_project_app/Models/stories_models.dart';
import 'package:human_project_app/pages/stories_views.dart';
import 'package:human_project_app/service/bouce_animation.dart';
import 'package:human_project_app/service/animation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';

class storiesWidget extends StatelessWidget {

  final stories storiesLIstWidget;

  const storiesWidget({this.storiesLIstWidget});

  @override
  Widget build(BuildContext context) {
    return widgetAnimator(
      Padding(
          padding: EdgeInsets.only(right: 10,),
          child: Material(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: InkWell(
              onTap:()async{
                var navigationResult = await Navigator.push(
                    context, PageTransition(
                    child:StoriesView(
                      views: storiesLIstWidget,
                    ),
                    duration: Duration(milliseconds: 900 ),
                    type: PageTransitionType.fade
                )
                );

                if(navigationResult == true){
                    Navigator.of(context).push(
                        PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context,_,__){
                              return Material(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(storiesLIstWidget.imgThird),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaY: 5,
                                              sigmaX: 10
                                          ),
                                          child: Container(
                                            color: Colors.black38,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: 50,
                                          left: 10,
                                          child: BouncewidgetAnimator(IconButton(
                                              icon: Icon(MdiIcons.close,
                                                  size: 40,
                                                  color: Colors.white),
                                              onPressed: (){
                                                Navigator.pop(context);
                                              }
                                          ))
                                      ),
                                      Container(
                                        child: Center(
                                          child: Container(
                                            height: 300,
//                                            color: Colors.white,
                                            child: Stack(
                                              children: <Widget>[
                                                Positioned(
                                                    top: 60,
                                                    right: 0,
                                                    left: 0,
                                                    child: Container(
                                                      height: 200,
//                                                      color: Colors.redAccent,
                                                      child: BouncewidgetAnimator(Center(
                                                        child: Container(
                                                          width: 300,
                                                          decoration: BoxDecoration(
                                                              color: Colors.white70,
                                                              borderRadius: BorderRadius.circular(10)
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets.only(top: 75,
                                                                right: 10,
                                                                left: 10,
                                                                bottom: 10),
                                                            child: Column(
                                                              children: <Widget>[
                                                                Text('Chaque secteur d\’investissement pour développer une affaire est risqué.'
                                                                    ,textAlign: TextAlign.center
                                                                    ,style:TextStyle(
                                                                        fontSize: 15,
                                                                        fontWeight: FontWeight.bold,
                                                                        fontFamily: 'Releway'
                                                                    )),
                                                                SizedBox(height: 20),
                                                                RaisedButton(
                                                                    color: Colors.grey[300],
                                                                    onPressed: (){},
                                                                    child: Container(
                                                                      width: double.infinity,
                                                                      child: Center(
                                                                        child: Text('REAGIR'
                                                                            ,style: TextStyle(
                                                                                fontFamily: 'Montserrat',
                                                                                fontSize: 16,
                                                                                letterSpacing: 1
                                                                            )),
                                                                      ),
                                                                    )
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ))
                                                    )
                                                ),
                                                Positioned(
                                                    top: 5,
                                                    right: 0,
                                                    left: 0,
                                                    child: BouncewidgetAnimator(Container(
                                                      height: 120,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          border: Border.all(
                                                              color: Colors.white,
                                                              width: 10
                                                          ),
                                                          color: Colors.yellow
                                                      ),
                                                      child: Center(
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: <Widget>[
                                                            Icon(MdiIcons.accountHeart,
                                                                size:60),
                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              );
                            }
                        ));
                }
              },
              child:  Container(
//              height: 50.0,
                width: 135.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(storiesLIstWidget.imgSecond),
                      fit: BoxFit.cover
                  ),

                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(.9),
                            Colors.black.withOpacity(.1)
                          ]
                      )
                  ) ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.white,
                                width: 2
                            ),
                            image: DecorationImage(
                                image: AssetImage(storiesLIstWidget.img),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      Text(storiesLIstWidget.title,style:
                        TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14

                        ),)
                    ],
                  ),
                ),
              ),
            )
          )
      )
    );
  }
}
