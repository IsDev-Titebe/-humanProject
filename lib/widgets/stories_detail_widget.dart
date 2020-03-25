import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:human_project_app/Models/stories_models.dart';
import 'package:human_project_app/service/bouce_animation.dart';
import 'package:human_project_app/service/first_animation.dart';
import 'package:human_project_app/pages/stories_views.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';


class StoriesDetail extends StatefulWidget {

  final stories Detail;

  const StoriesDetail({this.Detail});

  @override
  _StoriesDetailState createState() => _StoriesDetailState();
}

class _StoriesDetailState extends State<StoriesDetail> {
  @override
  Widget build(BuildContext context) {
    return firstwidgetAnimator(Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.35),
                  blurRadius: 10,
                  offset: Offset(5, 10)
              )
            ],
          ),
          margin: EdgeInsets.symmetric(
              horizontal: 40,vertical: 10
          ),
          height: 140,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(),
              ),
              Expanded(
                  flex: 5,
                  child: Padding(
                      padding: EdgeInsets.only(left: 30,right: 50,top: 10),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          firstwidgetAnimator(Text(widget.Detail.title,
                              style:TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700
                              ))),
                          SizedBox(height: 15),
                          firstwidgetAnimator(Text(widget.Detail.description,
                              style:TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700
                              )))
                        ],
                      ))
              )
            ],
          ),
        ),
        InkWell(
          onTap: () async {
            var navigationResult = await Navigator.push(
                context, PageTransition(
                child:StoriesView(
                  views:  widget.Detail,
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
                                    image: AssetImage(widget.Detail.imgThird),
                                    fit: BoxFit.cover
                                )
                            ),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaY: 20,
                                        sigmaX: 20
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
                                                                onPressed: (){},
                                                                child: Container(
//                                                                        color: Colors.redAccent,
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
          child: Container(
            height: 160,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 28),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 10,
                          offset: Offset(5, 10)
                      )
                    ],
                    image: DecorationImage(
                        image: AssetImage(widget.Detail.img),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}

