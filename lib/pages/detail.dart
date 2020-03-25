import 'dart:ui';

import 'package:flutter_launch/flutter_launch.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:share_it/share_it.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:human_project_app/Models/orphelinat_models.dart';
import 'package:human_project_app/service/bouce_animation.dart';
import 'package:human_project_app/service/first_animation.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';




class detailPage extends StatefulWidget {
  final orphe orphelist;

  detailPage ({this.orphelist});

  @override
  _detailPageState createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> with TickerProviderStateMixin{

  AnimationController _controller;

  Animation<double> _opacityContainer;
  AnimationController _iconAnimationController;
  PageController controllerView = PageController();

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(vsync: this,duration: Duration(seconds: 1));

    _controller = AnimationController(vsync: this,duration: Duration(seconds: 3));

    _opacityContainer = Tween<double>(begin: 0.0,end: 1.0).animate(_controller);

  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

void customlauncher(command)async{
    if(await canLaunch(command)){
      await launch(command);
    }else{
      throw'could not $command';
    }
}

  void whatAppOpen(String number) async{
    await FlutterLaunch.launchWathsApp(
        phone: number,message: 'hello'
    );
  }


  int currentPageIndex = 0;
  bool _isSelected = false;
  double _bottomContainer = 150;
  double _opacityText = 1.0;
  double _opacityTitle = 0.0;
  bool  _isAnimated = false;
  bool  _isAnimatedContainer = false;

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child:Container(
                width: screenWidth,
                height: screenHeight/1.1,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.orphelist.img),
                        fit: BoxFit.cover
                    )
                ),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(.5),
                            Colors.black.withOpacity(.9)
                          ]
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          bottom: screenHeight/5,
                          child: Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: firstwidgetAnimator(
                                  AnimatedOpacity(
                                      opacity: _opacityText,
                                      duration: _isAnimated ? Duration(milliseconds: 600)
                                          :Duration(seconds: 3),
                                     child: Row(
                                       children: <Widget>[
                                         Column(
                                           children: <Widget>[
                                             Container(
                                               height: 10,
                                               width: 10,
                                               decoration: BoxDecoration(
                                                   color: Colors.white,
                                                   borderRadius: BorderRadius.circular(20)
                                               ),
                                             ),
                                             SizedBox(height:10),
                                             Container(
                                               height: 10,
                                               width: 10,
                                               decoration: BoxDecoration(
                                                   color: Colors.white,
                                                   borderRadius: BorderRadius.circular(20)
                                               ),
                                             ),
                                             SizedBox(height:10),
                                             Container(
                                               height: 10,
                                               width: 10,
                                               decoration: BoxDecoration(
                                                   color: Colors.white,
                                                   borderRadius: BorderRadius.circular(20)
                                               ),
                                             ),
                                             SizedBox(height:10),
                                             Container(
                                               height: 10,
                                               width: 10,
                                               decoration: BoxDecoration(
                                                   color: Colors.white,
                                                   borderRadius: BorderRadius.circular(20)
                                               ),
                                             )

                                           ],
                                         ),SizedBox(width: 10),
                                         Column(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: <Widget>[
                                             Text(widget.orphelist.name,style: TextStyle(
                                                 color: Colors.white,
                                                 fontFamily: 'Montserrat',
                                                 fontSize: 34,
                                                 fontWeight: FontWeight.bold
                                             ),),
                                             SizedBox(width: 10),
                                             Text(widget.orphelist.description,style: TextStyle(
                                                 color: Colors.white,
                                                 fontFamily: 'Releway',
                                                 letterSpacing: 0.6,
                                                 fontSize: 15,
                                                 fontWeight: FontWeight.bold
                                             ),),
                                           ],
                                         )

                                       ],
                                     )),
                                  )

                          )
                      )
                    ],
                  ),
                ),
              )
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child:AnimatedOpacity(
                  opacity: _opacityTitle,
                  duration: _isAnimated ? Duration(milliseconds: 1500)
                      :Duration(milliseconds: 600),
                  child: Container(
                height: 400,
                width: double.infinity,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaY: 20,
                      sigmaX: 20
                  ),
                  child: Container(
                    color: Colors.black54,
                  ),
                ),
              ))
          ),
          Positioned(
              top: 35,
              left: 70,
              child: AnimatedOpacity(
                  opacity: _opacityTitle,
                  curve: Curves.fastOutSlowIn,
                  duration: _isAnimated ? Duration(seconds: 4)
                      :Duration(milliseconds: 600),
                  child:  Align(
                    alignment: Alignment.center,
                    child:Text(widget.orphelist.name,style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 19,
                          fontWeight: FontWeight.bold
                      ),),

                  )
              ),
          ),
          Positioned(
              top: 30,
              left: 10,
              child: firstwidgetAnimator(
                  AnimatedOpacity(
                      opacity: _opacityText,
                      curve: Curves.fastOutSlowIn,
                      duration: _isAnimated ? Duration(milliseconds: 600)
                          :Duration(seconds: 1),
                      child: Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black.withOpacity(.3)
                          ),
                          child:IconButton(
                              icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 18),
                              onPressed: (){
                                Navigator.pop(context);
                              }
                          )
                      )
                  ),
              )
          ),
          Positioned(
              top: 30,
              right: 10,
              child: firstwidgetAnimator(
                  AnimatedOpacity(
                      opacity: _opacityText,
                      curve: Curves.fastOutSlowIn,
                      duration: _isAnimated ? Duration(milliseconds: 600)
                          :Duration(seconds: 1),
                      child: Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black.withOpacity(.3)
                          ),
                          child:IconButton(
                              icon: Icon(Icons.share,color: Colors.white,size: 18),
                              onPressed: (){
                                _controller.forward();
                                print('$screenHeight');
                              }
                          )
                      )
                  ),
              )
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(seconds: 2),
               //   reverseDuration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  width: screenWidth,
                  height: _bottomContainer,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)
                      )
                  ),
                  child: _bottomContainer == 150
                         ? Column(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: <Widget>[
                               Container(
                                 height: 150,
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.only(
                                         topRight: Radius.circular(10),
                                         topLeft: Radius.circular(10)
                                     )
                                 ),
                                 child: AnimatedOpacity(
                                     opacity: _opacityText,
                                     duration: _isAnimated ? Duration(milliseconds: 600)
                                         :Duration(seconds: 1),
                                     child: firstwidgetAnimator(
                                       Container(
                                         margin: EdgeInsets.only(
                                             top: 15,
                                             right: 72,
                                             left: 10,
                                             bottom: 10
                                         ),
                                         child: Row(
                                           children: <Widget>[
                                             Expanded(
                                                flex: 2,
                                                child: Column(
                                                  children: <Widget>[
                                                    Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          margin: EdgeInsets.only(
                                                              top: 15,
                                                              left: 15,
                                                              right: 15,
                                                              bottom: 5
                                                          ),
                                                          child: Icon(Icons.location_on,size: 35),
                                                        )
                                                    ),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          margin: EdgeInsets.only(
//                                                            top: 5,
                                                            left: 15,
                                                            right: 15,
                                                            bottom: 15
                                                          ),
                                                          child: Column(
                                                            children: <Widget>[
                                                              Text(widget.orphelist.city),
                                                              Text(widget.orphelist.localisation,
                                                                style: TextStyle(
                                                                  letterSpacing:2
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        )
                                                    )
                                                  ],
                                                )
                                            ),
                                             Expanded(
                                                 flex: 2,
                                                 child: Column(
                                                   children: <Widget>[
                                                     Expanded(
                                                         flex: 2,
                                                         child: Container(
                                                           margin: EdgeInsets.only(
                                                               top: 15,
                                                               left: 15,
                                                               right: 15,
                                                               bottom: 5
                                                           ),
                                                           child: Icon(MdiIcons.humanChild,size: 35),
                                                         )
                                                     ),
                                                     Expanded(
                                                         flex: 2,
                                                         child: Container(
                                                             margin: EdgeInsets.only(
//                                                            top: 5,
                                                                 left: 15,
                                                                 right: 15,
                                                                 bottom: 15
                                                             ),
                                                             child: Column(
                                                               children: <Widget>[
                                                                 Text(widget.orphelist.nombres),
                                                               ],
                                                             )
                                                         )
                                                     )
                                                   ],
                                                 )
                                             ),
                                             Expanded(
                                                 flex: 2,
                                                 child: Column(
                                                   children: <Widget>[
                                                     Expanded(
                                                         flex: 2,
                                                         child: Container(
                                                           margin: EdgeInsets.only(
                                                               top: 15,
                                                               left: 15,
                                                               right: 15,
                                                               bottom: 5
                                                           ),
                                                           child: Icon(MdiIcons.accountHeart
                                                             ,size: 35),
                                                         )
                                                     ),
                                                     Expanded(
                                                         flex: 2,
                                                         child: Container(
                                                             margin: EdgeInsets.only(
//                                                            top: 5,
                                                                 left: 15,
                                                                 right: 15,
                                                                 bottom: 15
                                                             ),
                                                             child: Column(
                                                               children: <Widget>[
                                                                 Text('faire',
                                                                     textAlign: TextAlign.center),
                                                                 Text('Un don',
                                                                   textAlign: TextAlign.center,
                                                                   style: TextStyle(
                                                                       letterSpacing:2
                                                                   ),
                                                                 )
                                                               ],
                                                             )
                                                         )
                                                     )
                                                   ],
                                                 )
                                             ),
                                           ],
                                         ),
                                       ),
                                     )
                                 )
                               )
                             ],
                           )
                         : Container(
                            height: 600,
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)
                        )
                         ),
                       child: AnimatedOpacity(
                           opacity: _opacityTitle,
                           duration: _isAnimated ? Duration(milliseconds: 1500)
                               :Duration(milliseconds: 600),
                           child: firstwidgetAnimator(
                             Container(
                               margin: EdgeInsets.only(top: 20),
                               child: Row(
                                 children: <Widget>[
                                   Expanded(
                                       flex: 9,
                                       child: Container(
                                           margin: EdgeInsets.only(
                                             top: 10,
                                             left: 10,
                                             bottom: 10
                                           ),
                                           child:PageView(
                                             controller: controllerView,
                                             scrollDirection: Axis.vertical,
                                             onPageChanged: (int page){
                                               print("Current Page: " + page.toString());
                                               setState(() {
                                                 currentPageIndex = page;
                                               });
                                             },
                                             children: <Widget>[
                                               Container(
                                                 margin: EdgeInsets.symmetric(
                                                   horizontal: 15
                                                 ),
                                                 child: Column(
                                                   children: <Widget>[
                                                     firstwidgetAnimator(Text('Overview',
                                                         style:TextStyle(
                                                             fontFamily: 'Montserrat',
                                                             fontSize: 25,
                                                             fontWeight: FontWeight.bold
                                                         ))),
                                                     SizedBox(height: 25),
                                                     firstwidgetAnimator(
                                                       Text('Chaque secteur d \’investissement pour développer une affaire est risqué car il est très dépendant de l\’évolution de l\’activité économique et du contexte international, qui influencent la consommation des produits.',
                                                           textAlign: TextAlign.left,
                                                           style: TextStyle(
                                                             letterSpacing: 0.5,
                                                               fontFamily: 'Releway',
                                                           fontSize: 15,
                                                               fontWeight: FontWeight.bold
                                                         ))),
                                                     SizedBox(height: 25),
                                                     firstwidgetAnimator(
                                                       Align(
                                                         alignment: Alignment.topLeft,
                                                         child: Text('PHOTOS',
                                                             textAlign: TextAlign.left,
                                                             style:TextStyle(
                                                                 fontFamily: 'Montserrat',
                                                                 color: Colors.grey,
                                                                 fontSize: 16,
                                                                 fontWeight: FontWeight.bold
                                                             )),
                                                       )
                                                     ),
                                                     SizedBox(height: 15),
                                                       Container(
                                                         height: 300,
                                                         child: Row(
                                                           children: <Widget>[
                                                             Expanded(
                                                                 flex: 2,
                                                                 child: Column(
                                                                   children: <Widget>[
                                                                     Expanded(
                                                                         flex: 2,
                                                                         child: firstwidgetAnimator(
                                                                             InkWell(
                                                                               onTap: (){
                                                                                  Navigator.of(context).
                                                                                  push(PageRouteBuilder(
                                                                                      opaque: false,
                                                                                      pageBuilder:(BuildContext context,_,__){
                                                                                        return Material(
                                                                                          child: Container(
                                                                                            width: MediaQuery.of(context).size.width,
                                                                                            height: MediaQuery.of(context).size.height,
                                                                                            decoration: BoxDecoration(
                                                                                                image: DecorationImage(
                                                                                                    image: AssetImage('Assets/img/img3.jpg'),
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
                                                                                                      color: Colors.white10.withOpacity(0.2),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  child: Center(
                                                                                                    child: InkWell(
                                                                                                       onDoubleTap: (){
                                                                                                         Navigator.pop(context);
                                                                                                       },
                                                                                                      child: BouncewidgetAnimator(
                                                                                                        Container(
                                                                                                          width: double.infinity,
                                                                                                          height: 250,
                                                                                                          child:Image.asset('Assets/img/img3.jpg'
                                                                                                                  ,fit: BoxFit.cover)
                                                                                                        ),
                                                                                                      )
                                                                                                    )
                                                                                                  ),
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                  ));
                                                                               },
                                                                               child: Container(
                                                                                     decoration: BoxDecoration(
                                                                                         borderRadius: BorderRadius.circular(15),
                                                                                         image: DecorationImage(
                                                                                             image: AssetImage('Assets/img/img3.jpg'),
                                                                                             fit: BoxFit.cover
                                                                                         )
                                                                                     ),
                                                                                   ),

                                                                             )
                                                                         )
                                                                     ),
                                                                     SizedBox(height: 10),
                                                                     Expanded(
                                                                         flex: 2,
                                                                         child: firstwidgetAnimator(
                                                                             InkWell(
                                                                               onTap: (){
                                                                                 Navigator.of(context).
                                                                                 push(PageRouteBuilder(
                                                                                     opaque: false,
                                                                                     pageBuilder:(BuildContext context,_,__){
                                                                                       return Material(
                                                                                         child: Container(
                                                                                           width: MediaQuery.of(context).size.width,
                                                                                           height: MediaQuery.of(context).size.height,
                                                                                           decoration: BoxDecoration(
                                                                                               image: DecorationImage(
                                                                                                   image: AssetImage('Assets/img/img6.jpg'),
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
                                                                                                     color: Colors.white10.withOpacity(0.2),
                                                                                                   ),
                                                                                                 ),
                                                                                               ),
                                                                                               Container(
                                                                                                 child: Center(
                                                                                                     child: InkWell(
                                                                                                         onDoubleTap: (){
                                                                                                           Navigator.pop(context);
                                                                                                         },
                                                                                                         child: BouncewidgetAnimator(
                                                                                                           Container(
                                                                                                               width: double.infinity,
                                                                                                               height: 250,
                                                                                                               child:Image.asset('Assets/img/img6.jpg'
                                                                                                                   ,fit: BoxFit.cover)
                                                                                                           ),
                                                                                                         )
                                                                                                     )
                                                                                                 ),
                                                                                               )
                                                                                             ],
                                                                                           ),
                                                                                         ),
                                                                                       );
                                                                                     }
                                                                                 ));
                                                                               },
                                                                               child: Container(
                                                                                 decoration: BoxDecoration(
                                                                                     borderRadius: BorderRadius.circular(15),
                                                                                     image: DecorationImage(
                                                                                         image: AssetImage('Assets/img/img6.jpg'),
                                                                                         fit: BoxFit.cover
                                                                                     )
                                                                                 ),
                                                                               ),

                                                                             )
                                                                         )
                                                                     ),
                                                                   ],
                                                                 )
                                                             ),
                                                             SizedBox(width: 10),
                                                             Expanded(
                                                                 flex: 2,
                                                                 child: Column(
                                                                   children: <Widget>[
                                                                     Expanded(
                                                                         flex: 3,
                                                                         child: firstwidgetAnimator(
                                                                             InkWell(
                                                                               onTap: (){
                                                                                 Navigator.of(context).
                                                                                 push(PageRouteBuilder(
                                                                                     opaque: false,
                                                                                     pageBuilder:(BuildContext context,_,__){
                                                                                       return Material(
                                                                                         child: Container(
                                                                                           width: MediaQuery.of(context).size.width,
                                                                                           height: MediaQuery.of(context).size.height,
                                                                                           decoration: BoxDecoration(
                                                                                               image: DecorationImage(
                                                                                                   image: AssetImage('Assets/img/img4.jpg'),
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
                                                                                                     color: Colors.white10.withOpacity(0.2),
                                                                                                   ),
                                                                                                 ),
                                                                                               ),
                                                                                               Container(
                                                                                                 child: Center(
                                                                                                     child: InkWell(
                                                                                                         onDoubleTap: (){
                                                                                                           Navigator.pop(context);
                                                                                                         },
                                                                                                         child: BouncewidgetAnimator(
                                                                                                           Container(
                                                                                                               width: double.infinity,
                                                                                                               height: 250,
                                                                                                               child:Image.asset('Assets/img/img4.jpg'
                                                                                                                   ,fit: BoxFit.cover)
                                                                                                           ),
                                                                                                         )
                                                                                                     )
                                                                                                 ),
                                                                                               )
                                                                                             ],
                                                                                           ),
                                                                                         ),
                                                                                       );
                                                                                     }
                                                                                 ));
                                                                               },
                                                                               child: Container(
                                                                                 decoration: BoxDecoration(
                                                                                     borderRadius: BorderRadius.circular(15),
                                                                                     image: DecorationImage(
                                                                                         image: AssetImage('Assets/img/img4.jpg'),
                                                                                         fit: BoxFit.cover
                                                                                     )
                                                                                 ),
                                                                               ),

                                                                             )
                                                                         )
                                                                     ),
                                                                     SizedBox(height: 10),
                                                                     Expanded(
                                                                         flex: 2,
                                                                         child: firstwidgetAnimator(
                                                                             InkWell(
                                                                               onTap: (){
                                                                                 Navigator.of(context).
                                                                                 push(PageRouteBuilder(
                                                                                     opaque: false,
                                                                                     pageBuilder:(BuildContext context,_,__){
                                                                                       return Material(
                                                                                         child: Container(
                                                                                           width: MediaQuery.of(context).size.width,
                                                                                           height: MediaQuery.of(context).size.height,
                                                                                           decoration: BoxDecoration(
                                                                                               image: DecorationImage(
                                                                                                   image: AssetImage('Assets/img/img10.jpg'),
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
                                                                                                     color: Colors.white10.withOpacity(0.2),
                                                                                                   ),
                                                                                                 ),
                                                                                               ),
                                                                                               Container(
                                                                                                 child: Center(
                                                                                                     child: InkWell(
                                                                                                         onDoubleTap: (){
                                                                                                           Navigator.pop(context);
                                                                                                         },
                                                                                                         child: BouncewidgetAnimator(
                                                                                                           Container(
                                                                                                               width: double.infinity,
                                                                                                               height: 250,
                                                                                                               child:Image.asset('Assets/img/img10.jpg'
                                                                                                                   ,fit: BoxFit.cover)
                                                                                                           ),
                                                                                                         )
                                                                                                     )
                                                                                                 ),
                                                                                               )
                                                                                             ],
                                                                                           ),
                                                                                         ),
                                                                                       );
                                                                                     }
                                                                                 ));
                                                                               },
                                                                               child: Container(
                                                                                 decoration: BoxDecoration(
                                                                                     borderRadius: BorderRadius.circular(15),
                                                                                     image: DecorationImage(
                                                                                         image: AssetImage('Assets/img/img10.jpg'),
                                                                                         fit: BoxFit.cover
                                                                                     )
                                                                                 ),
                                                                               ),

                                                                             )
                                                                         )
                                                                     ),
                                                                   ],
                                                                 )
                                                             ),
                                                           ],
                                                         ),
                                                       )

                                                   ],
                                                 )
                                               ),
                                               Container(
                                                 margin: EdgeInsets.symmetric(
                                                     horizontal: 15
                                                 ),
                                                 child: Column(
                                                   children: <Widget>[
                                                     firstwidgetAnimator(Text('Contacts',
                                                         style:TextStyle(
                                                             fontFamily: 'Montserrat',
                                                             fontSize: 25,
                                                             fontWeight: FontWeight.bold
                                                         ))),
                                                     SizedBox(height: 25),
                                                     Container(
                                                       child: firstwidgetAnimator(
                                                           Text('Chaque secteur d \’investissement pour développer une affaire est risqué car il est très dépendant de l\’évolution de l\’activité économique et du contexte international.',
                                                               textAlign: TextAlign.left,
                                                               style: TextStyle(
                                                                   fontFamily: 'Releway',
                                                                   fontSize: 15,
                                                                   fontWeight: FontWeight.bold
                                                               ))),
                                                     ),
                                                     SizedBox(height: 25),
                                                     firstwidgetAnimator(
                                                         Align(
                                                           alignment: Alignment.topLeft,
                                                           child: Text('AMENTIES',
                                                               textAlign: TextAlign.left,
                                                               style:TextStyle(
                                                                   fontFamily: 'Montserrat',
                                                                   color: Colors.grey,
                                                                   fontSize: 16,
                                                                   fontWeight: FontWeight.bold
                                                               )),
                                                         )
                                                     ),
                                                     SizedBox(height: 15),
                                                     Container(
                                                       height: 300,
                                                       child: Column(
                                                         children: <Widget>[
                                                           firstwidgetAnimator(ListTile(
                                                             onTap: (){
                                                               customlauncher('tel:${widget.orphelist.phone}');
                                                             },
                                                             leading: Icon(MdiIcons.phone, color: Color(0xFF417BFB)),
                                                             title: Text(widget.orphelist.phone,
                                                               style: TextStyle(
                                                                   fontFamily: 'Montserrat',
                                                                   fontSize: 16,
                                                                   fontWeight: FontWeight.bold,
                                                                   color: Colors.black87
                                                               ),
                                                             ),
                                                           )),
                                                           firstwidgetAnimator(ListTile(
                                                             onTap: () {
                                                              FlutterOpenWhatsapp.sendSingleMessage('+243815800035', 'salut la famille');
                                                              print('whatsapp');
                                                             },
                                                             leading: Icon(MdiIcons.whatsapp,color: Color(0xFF417BFB)),
                                                             title: Text('Whatsapp',
                                                               style: TextStyle(
                                                                   fontFamily: 'Montserrat',
                                                                   fontSize: 16,
                                                                   fontWeight: FontWeight.bold,
                                                                   color: Colors.black87
                                                               ),
                                                             ),
                                                           )),
                                                           firstwidgetAnimator(ListTile(
                                                             onTap: (){
                                                               customlauncher('https://facebook.com');
                                                             },
                                                             leading: Icon(MdiIcons.facebook, color: Color(0xFF417BFB)),
                                                             title: Text('facebook',
                                                               style: TextStyle(
                                                                   fontFamily: 'Montserrat',
                                                                   fontSize: 16,
                                                                   fontWeight: FontWeight.bold,
                                                                   color: Colors.black87
                                                               ),
                                                             ),
                                                           )),
                                                           firstwidgetAnimator(ListTile(
                                                             onTap: (){
                                                               customlauncher('mailto:yourmail@email.com');
                                                             },
                                                             leading: Icon(MdiIcons.contactMail, color: Color(0xFF417BFB)),
                                                             title: Text('nom@gmail.com',
                                                               style: TextStyle(
                                                                   fontFamily: 'Montserrat',
                                                                   fontSize: 16,
                                                                   fontWeight: FontWeight.bold,
                                                                   color: Colors.black87
                                                               ),
                                                             ),
                                                           )),
                                                           firstwidgetAnimator(ListTile(
                                                             onTap: (){
                                                               customlauncher('https://google.com');
                                                             },
                                                             leading: Icon(MdiIcons.web, color: Color(0xFF417BFB)),
                                                             title: Text('www.site.com',
                                                               style: TextStyle(
                                                                   fontFamily: 'Montserrat',
                                                                   fontSize: 16,
                                                                   fontWeight: FontWeight.bold,
                                                                   color: Colors.black87
                                                               ),
                                                             ),
                                                           )),
                                                         ],
                                                       ),
                                                     )
                                                   ],
                                                 )
                                               ),
                                               Container(
                                                 margin: EdgeInsets.symmetric(
                                                     horizontal: 15
                                                 ),
                                                 child: Column(
                                                   children: <Widget>[
                                                     firstwidgetAnimator(Text('Localisation',
                                                         style:TextStyle(
                                                             fontFamily: 'Montserrat',
                                                             fontSize: 25,
                                                             fontWeight: FontWeight.bold
                                                         ))),
                                                     SizedBox(height: 25),
                                                     Container(
                                                       child:  firstwidgetAnimator(
                                                           Text('Chaque secteur d \’investissement pour développer une affaire est risqué car il est très dépendant de l\’évolution de l\’activité économique et du contexte international.',
                                                               textAlign: TextAlign.left,
                                                               style: TextStyle(
                                                                   fontFamily: 'Releway',
                                                                   fontSize: 15,
                                                                   fontWeight: FontWeight.bold
                                                               ))),
                                                     ),
                                                     SizedBox(height: 25),
                                                     firstwidgetAnimator(
                                                         Align(
                                                           alignment: Alignment.topLeft,
                                                           child: Text('CARTE',
                                                               textAlign: TextAlign.left,
                                                               style:TextStyle(
                                                                   fontFamily: 'Montserrat',
                                                                   color: Colors.grey,
                                                                   fontSize: 16,
                                                                   fontWeight: FontWeight.bold
                                                               )),
                                                         )
                                                     ),
                                                     SizedBox(height: 15),
                                                     Container(
                                                       height: 300,
                                                       child: firstwidgetAnimator(
                                                         Container(
                                                           decoration: BoxDecoration(
                                                             borderRadius:BorderRadius.circular(10)
                                                           ),
                                                           child: Stack(
                                                             children: <Widget>[
                                                               Container(
                                                                 decoration: BoxDecoration(
                                                               borderRadius:BorderRadius.circular( 15),                                                          image: DecorationImage(
                                                                         image:AssetImage('Assets/img_maps.jpg'),fit: BoxFit.cover
                                                                     )
                                                                 ),
                                                               ),
                                                               Positioned(
                                                                   top: 70,
                                                                   right: 20,
                                                                   child: AvatarGlow(
                                                                       startDelay: Duration(milliseconds: 1000),
                                                                       duration: Duration(milliseconds: 2000),
                                                                       repeat: true,
                                                                       showTwoGlows: true,
                                                                       glowColor: Colors.white,
                                                                       repeatPauseDuration: Duration(milliseconds: 100),
                                                                       child: Material(
                                                                         elevation: 8,
                                                                         shape: CircleBorder(),
                                                                         child: CircleAvatar(
                                                                           child: Icon(Icons.location_on,color: Colors.white54),
                                                                           radius: 16,
                                                                           backgroundColor: Colors.lightBlue
                                                                         ),
                                                                       ),
                                                                       endRadius: 90)
                                                               )
                                                             ],
                                                           ),
                                                         )
                                                       ),
                                                     )
                                                   ],
                                                 ),
                                               ),
                                               Container(
                                                 margin: EdgeInsets.symmetric(
                                                     horizontal: 15
                                                 ),
                                                 child: Column(
                                                   children: <Widget>[
                                                     firstwidgetAnimator(Text('Reviews',
                                                         style:TextStyle(
                                                             fontFamily: 'Montserrat',
                                                             fontSize: 25,
                                                             fontWeight: FontWeight.bold
                                                         ))),
                                                     SizedBox(height: 25),
                                                     Container(
                                                       height: 100,
                                                       child:  firstwidgetAnimator(
                                                           Column(
                                                             children: <Widget>[
                                                               Expanded(
                                                                   child: firstwidgetAnimator(
                                                                       ListTile(
                                                                           leading: CircleAvatar(
                                                                             backgroundImage:
                                                                             AssetImage('Assets/img_isaac.jpg'),
                                                                           ),
                                                                           title: Text('Titebe',
                                                                             style: TextStyle(
                                                                                 fontWeight: FontWeight.bold,
                                                                                 fontSize: 15,
                                                                                 fontFamily: 'Montserrat'
                                                                             ),),
                                                                           subtitle: Text('il y\'a 1 min',
                                                                             style: TextStyle(
                                                                                 color: Colors.grey,
                                                                                 fontSize: 11
                                                                             ),),
                                                                           trailing: Icon(MdiIcons.star,
                                                                               color: Colors.yellow)
                                                                       )
                                                                   )
                                                               ),
                                                               SizedBox(height: 25),
                                                               Expanded(
                                                                   child: firstwidgetAnimator(
                                                                       Container(
                                                                         margin: EdgeInsets.only(
                                                                           left: 15,
                                                                         ),
                                                                         child: Text('Chaque secteur d \’investissement pour développer une affaire est risqué car il est très dépendant de l\’évolution de l\’activité économique et du contexte international.',
                                                                             textAlign: TextAlign.left,
                                                                             style: TextStyle(
                                                                                 fontFamily: 'Releway',
                                                                                 fontSize: 15,
                                                                                 fontWeight: FontWeight.bold
                                                                             )),
                                                                       )
                                                                   )
                                                               )
                                                             ],
                                                           )
                                                       ),
                                                     ),
                                                     firstwidgetAnimator(Container(
                                                         margin: EdgeInsets.only(top: 20,
                                                             left: 30,right: 20),
                                                         height: 1,color: Colors.grey)),
                                                     Container(
                                                       height: 100,
                                                       child:  firstwidgetAnimator(
                                                           Column(
                                                             children: <Widget>[
                                                               Expanded(
                                                                   child: firstwidgetAnimator(
                                                                       ListTile(
                                                                           leading: CircleAvatar(
                                                                             backgroundImage:
                                                                             AssetImage('Assets/loginScreen3.jpg'),
                                                                           ),
                                                                           title: Text('Aser',
                                                                             style: TextStyle(
                                                                                 fontWeight: FontWeight.bold,
                                                                                 fontSize: 15,
                                                                                 fontFamily: 'Montserrat'
                                                                             ),),
                                                                           subtitle: Text('il y\'a 1 min',
                                                                             style: TextStyle(
                                                                                 color: Colors.grey,
                                                                                 fontSize: 11
                                                                             ),),
                                                                           trailing: Icon(MdiIcons.star,
                                                                               color: Colors.yellow)
                                                                       )
                                                                   )
                                                               ),
                                                               SizedBox(height: 25),
                                                               Expanded(
                                                                   child: firstwidgetAnimator(
                                                                       Container(
                                                                         margin: EdgeInsets.only(
                                                                           left: 15,
                                                                         ),
                                                                         child: Text('Chaque secteur d \’investissement pour développer une affaire est risqué car il est très dépendant de l\’évolution de l\’activité économique et du contexte international.',
                                                                             textAlign: TextAlign.left,
                                                                             style: TextStyle(
                                                                                 fontFamily: 'Releway',
                                                                                 fontSize: 15,
                                                                                 fontWeight: FontWeight.bold
                                                                             )),
                                                                       )
                                                                   )
                                                               )
                                                             ],
                                                           )
                                                       ),
                                                     ),
                                                     firstwidgetAnimator(
                                                         Container(
                                                         margin: EdgeInsets.only(top: 20,
                                                             left: 30,right: 20),
                                                         height: 1,color: Colors.grey)),
                                                     Container(
                                                       height: 100,
                                                       child:  firstwidgetAnimator(
                                                           Column(
                                                             children: <Widget>[
                                                               Expanded(
                                                                   child: firstwidgetAnimator(
                                                                       ListTile(
                                                                           leading: CircleAvatar(
                                                                             backgroundImage:
                                                                             AssetImage('Assets/loginScreen.jpg'),
                                                                           ),
                                                                           title: Text('Jephte',
                                                                             style: TextStyle(
                                                                                 fontWeight: FontWeight.bold,
                                                                                 fontSize: 15,
                                                                                 fontFamily: 'Montserrat'
                                                                             ),),
                                                                           subtitle: Text('il y\'a 1 min',
                                                                             style: TextStyle(
                                                                                 color: Colors.grey,
                                                                                 fontSize: 11
                                                                             ),),
                                                                           trailing: Icon(MdiIcons.star,
                                                                               color: Colors.yellow)
                                                                       )
                                                                   )
                                                               ),
                                                               SizedBox(height: 25),
                                                               Expanded(
                                                                   child: firstwidgetAnimator(
                                                                       Container(
                                                                         margin: EdgeInsets.only(
                                                                           left: 15,
                                                                         ),
                                                                         child: Text('Chaque secteur d \’investissement pour développer une affaire est risqué car il est très dépendant de l\’évolution de l\’activité économique et du contexte international.',
                                                                             textAlign: TextAlign.left,
                                                                             style: TextStyle(
                                                                                 fontFamily: 'Releway',
                                                                                 fontSize: 15,
                                                                                 fontWeight: FontWeight.bold
                                                                             )),
                                                                       )
                                                                   )
                                                               )
                                                             ],
                                                           )
                                                       ),
                                                     ),
                                                     SizedBox(height:90),
                                                     Padding(
                                                         padding: EdgeInsets.only(
                                                           left: 3,
                                                         ),
                                                         child:Align(
                                                           alignment: Alignment.bottomLeft,
                                                           child: Container(
                                                             height: 60,
                                                             width: 130,
                                                             child: firstwidgetAnimator(Container(
                                                               child:FlatButton(
                                                                 onPressed:(){

                                                                 },
                                                                 child: Text('Tout Voir',
                                                                   style: TextStyle(
                                                                       fontWeight: FontWeight.bold,
                                                                       fontSize: 15,
                                                                       fontFamily: 'Montserrat'
                                                                   ),),
                                                               ),
                                                             ))
                                                           ),
                                                         )
                                                     )
                                                   ],
                                                 ),
                                               ),
                                             ],
                                           )
                                       )
                                   ),
                                   Expanded(
                                       flex: 2,
                                       child: Container(
                                          margin: EdgeInsets.only(
                                            bottom: 80,
                                            right: 20
                                          ),
                                           child: Column(
                                             mainAxisAlignment: MainAxisAlignment.end,
                                             children: <Widget>[
                                               firstwidgetAnimator(
                                                   Container(
                                                     child: DotsIndicator(
                                                         dotsCount: 4,
                                                         position:currentPageIndex.toDouble(),
                                                         axis: Axis.vertical,
                                                         decorator: DotsDecorator(
                                                           size: const Size.square(9.0),
                                                           spacing: EdgeInsets.all(3),
                                                           activeSize: const Size(9.0,18.0),
                                                           activeShape: RoundedRectangleBorder(
                                                             borderRadius: BorderRadius.circular(5.0)
                                                           )
                                                         ),
                                                     ),
                                                   )
                                               ),
                                               SizedBox(height: 220),
                                               firstwidgetAnimator(
                                                   IconButton(
                                                       icon: Icon(MdiIcons.accountHeart,
                                                           color: Colors.grey),
                                                       onPressed: (){
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
                                                                               image: AssetImage('Assets/img/woman.jpg'),
                                                                               fit: BoxFit.cover
                                                                           )
                                                                       ),
                                                                       child: Stack(
                                                                         children: <Widget>[
                                                                           Container(
                                                                             child: BackdropFilter(
                                                                               filter: ImageFilter.blur(
                                                                                   sigmaY: 5,
                                                                                   sigmaX: 5
                                                                               ),
                                                                               child: Container(
                                                                                 color: Colors.white10,
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
                                                                                 child: Stack(
                                                                                   children: <Widget>[
                                                                                     Positioned(
                                                                                         top: 60,
                                                                                         right: 0,
                                                                                         left: 0,
                                                                                         child: Container(
                                                                                             height: 200,
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
                                                   )
                                               ),
                                               firstwidgetAnimator(
                                                   IconButton(
                                                       icon: Icon(Icons.share,
                                                           color: Colors.grey),
                                                       onPressed: (){
                                                         ShareIt.link(
                                                           url: 'htttp://google/com',
                                                           androidSheetTitle: 'lien google'
                                                         );
                                                       }
                                                   )
                                               ),
                                               firstwidgetAnimator(
                                                   IconButton(
                                                       icon: _isSelected ? Icon(Icons.favorite,
                                                           color: Colors.grey)
                                                           : Icon(Icons.favorite_border,
                                                            color: Colors.grey),
                                                       onPressed: (){
                                                         setState(() {
                                                           _isSelected = !_isSelected;

                                                         });
                                                       }
                                                   )
                                               )
                                             ],
                                           )
                                       )
                                   )
                                 ],
                               )
                             )
                           ),
                       ),
                         )
                 ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton:
          firstwidgetAnimator(
            InkWell(
              onTap: (){
                setState(() {
                  _bottomContainer == 150
                      ? _isAnimated = true
                      : _isAnimated = false;

                  _isAnimated ? _bottomContainer = 600 : _bottomContainer = 150;
                  _isAnimated ? _opacityText = 0.0 : _opacityText = 1.0;
                  _isAnimated ? _opacityTitle = 1.0 : _opacityTitle = 0.0;

                  _isAnimated
                      ? _isAnimatedContainer = true
                      : _isAnimatedContainer = false;

                  _isAnimatedContainer
                      ? _controller.forward()
                      : _controller.reverse();

                  onIconPressed();
                });
              },
              child: Container(
                width: 55,
                height: 55,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.35),
                          blurRadius: 10,
                          offset: Offset(5, 10)
                      )
                    ],
                    color: Color(0xFF417BFB),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    )
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent.shade100,
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: Color(0xFF417BFB),
                    child: AnimatedIcon(
                      icon:
                      AnimatedIcons.menu_close,
                      progress: _iconAnimationController.view,
                      color: Colors.white,size: 18,),

                    )
                  ),
                ),
              ),
            ),
    );
  }

  void onIconPressed() {
    animationStatus ? _iconAnimationController.reverse() : _iconAnimationController.forward();
  }

  bool get animationStatus{
    final AnimationStatus  status = _iconAnimationController.status;
    return status == AnimationStatus.completed;
  }

}

