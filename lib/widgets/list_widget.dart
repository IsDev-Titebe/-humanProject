import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:human_project_app/Models/orphelinat_models.dart';
import 'package:human_project_app/pages/detail.dart';
import 'package:human_project_app/service/animation.dart';
import 'package:page_transition/page_transition.dart';



class listWidget extends StatelessWidget {

  final orphe orphelist;

  listWidget({this.orphelist});

  @override
  Widget build(BuildContext context) {
    return widgetAnimator(
       Stack(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Container(
                  height: 275.0,
                  width: double.infinity,

                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: AssetImage(orphelist.img),
                        fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.35),
                        blurRadius: 10,
                        offset: Offset(5, 10)
                    )
                  ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black.withOpacity(0.5)
                        ),
                      ),
                      Positioned(
                          top: 10.0,
                          left: 10.0,
                          child: Padding(
                              padding: EdgeInsets.only(right: 25,left: 10),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    height: 40,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.star,color: Colors.white,size: 12.0,),
                                          SizedBox(width: 5.0),
                                          Text(orphelist.favorite,style: TextStyle(color: Colors.white),),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 155.0),
                                  BouncingWidget(
                                  child: Row(
                                  children: <Widget>[
                                    Text('Savoir Plus',style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Ralaway'
                                    )),
                                    Icon(Icons.arrow_right,color: Colors.white,size: 25.0)
                                  ],
                                  ),
                                    onPressed: () {
                                      Navigator.push(context, PageTransition(child: detailPage(orphelist: orphelist), type:PageTransitionType.downToUp));
                                    },
                                  )
                                ],
                              )
                          )
                      ),
                      Positioned(
                          top: 165.0,
                          left: 10.0,
                          child: Container(
                              width: 200.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(orphelist.name,
                                      style:
                                    TextStyle(
                                        letterSpacing: 0.9,
                                        fontFamily: 'Ralaway',
                                        fontSize: 19.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  ),

                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(orphelist.description,style:
                                    TextStyle(
                                        fontFamily: 'Ralaway',
                                        fontSize: 13.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  ),

                                ],
                              )
                          )
                      ),
                      Positioned(
                          top: 225.0,
                          left: 10.0,
                          child: Padding(
                            padding: EdgeInsets.only(right: 20),
                            child:Row(
                              children: <Widget>[
                                Icon(Icons.location_on,color: Colors.white,size: 17),
                                Text(orphelist.localisation,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Ralaway',
                                      color: Colors.white,
                                      fontSize: 14.0
                                  ),),
                                Text(orphelist.city,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Ralaway',
                                      color: Colors.white,
                                      fontSize: 14.0
                                  ),),

                                SizedBox(width: 30),
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      height: 30.0,
                                      width: 50.0,
                                    ),
                                    Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: Colors.cyan
                                      ),
                                    ),
                                    Positioned(
                                        left: 15.0,
                                        child: Container(
                                          height: 30.0,
                                          width: 30.0,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20.0),
                                              color: Colors.white
                                          ),
                                          child: Center(
                                            child: Icon(Icons.child_care),
                                          ),
                                        )
                                    )
                                  ],
                                ),
                                Text(orphelist.nombres,
                                    style:TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Ralaway',
                                        color: Colors.white,
                                        fontSize: 14.0
                                    ))
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                )
            ),
          ],
        ),

    );
  }
}
