import 'package:badges/badges.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:human_project_app/Models/fondation_ong_models.dart';
import 'package:human_project_app/Models/orphelinat_models.dart';
import 'package:human_project_app/maps_dashbord.dart';
import 'package:human_project_app/pages/about.dart';
import 'package:human_project_app/pages/notifications.dart';
import 'package:human_project_app/pages/profile.dart';
import 'package:human_project_app/pages/seach.dart';
import 'package:human_project_app/pages/settings.dart';
import 'package:human_project_app/pages/stories_list.dart';
import 'package:human_project_app/service/first_animation.dart';
import 'package:human_project_app/widgets/fondation_listWidget.dart';
import 'package:human_project_app/widgets/list_widget.dart';
import 'package:human_project_app/widgets/stories_widget.dart';
import 'package:page_transition/page_transition.dart';
import'package:human_project_app/Models/stories_models.dart';



class listTab extends StatefulWidget {

  @override
  _listTabState createState() => _listTabState();
}

class _listTabState extends State<listTab>
    with TickerProviderStateMixin {

  TabController _tabController;

  AnimationController _controller;
  AnimationController _fadeAnimationcontroller;

  Animation<double> _fadeTransition,_fadeAnimation;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this,initialIndex: 0);


    _controller = AnimationController(vsync: this,duration: Duration(seconds: 1));
    _fadeAnimationcontroller = AnimationController(vsync: this,duration: Duration(milliseconds: 400));



    _fadeTransition = Tween<double>(begin:0.0,end: 1.0)
        .animate(_controller)
      ..addStatusListener((status){
        if(status == AnimationStatus.completed){
          _fadeAnimationcontroller.forward();
        }
      });

    _fadeAnimation = Tween<double>(begin:0.0,end: 1.0)
        .animate(_controller);


    _controller.forward();

  }


  Future<bool> _onBackPressed(){
    return showDialog(
        context: context,
        builder: (context){
          return firstwidgetAnimator(
              CupertinoAlertDialog(
                title: Text('Confirmez',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'aladin'
                    )),
//            contentPadding: EdgeInsets.all(20),
                content: Text('Souhaitez-vous vraiment quitter?',
                  style: TextStyle(
                      fontFamily: 'aladin'
                  ),),
                actions: <Widget>[
                  FlatButton(
                    onPressed: (){
                      Navigator.pop(context,false);
                    },
                    child: Text('Non',
                      style: TextStyle(
//                    color: Colors.cyan,
                          fontSize: 15,
                          fontFamily: 'aladin'
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: (){
                      Navigator.pop(context,true);
                    },
                    child: Text('Oui',
                      style: TextStyle(
//                      color: Colors.cyan,
                          fontSize: 17,
                          fontFamily: 'aladin'

                      ),),
                  ),
                ],
              )
          );
        }
    );
  }

  int selectedIndex = 0;

   getlistSeleted(int index){
    setState(() {
      this.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
             animation: _controller,
             builder: (context, Widget child){
               return WillPopScope(
                   onWillPop: _onBackPressed,
                   child: firstwidgetAnimator(
                        Scaffold(
                          backgroundColor: Colors.white,
                          body: DefaultTabController(
                            length: 4, 
                            child: NestedScrollView(
                              headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
                                return <Widget> [
                                  SliverAppBar(
                                     expandedHeight: 345,
                                     elevation: 5.0,
                                     backgroundColor: Colors.white,
                                     
                                     
                                     centerTitle: true,
                                     title: Text('wema',style: TextStyle(
                                       fontFamily: 'Montserrat',
                                     color: Color(0xFF417BFB)//Color(0xff103860),
                                   ),),
                                  
                                  
                                   leading: firstwidgetAnimator(
                                     BouncingWidget(
                                         duration: Duration(milliseconds: 100),
                                         scaleFactor: 1.5,
                                         onPressed: () {
                                           Navigator.push(context, PageTransition(child: MenuDashboardPage(), type: PageTransitionType.downToUp));
                                         },
                                         child: Icon(Icons.location_on,
                                           color: Color(0xFF417BFB), //Color(0xff103860),
                                           size: 24,)
                                     ),
                                   ),


                                   actions: <Widget>[
                                     firstwidgetAnimator(
                                       IconButton(icon:
                                       Icon(Icons.search,
                                         color: Color(0xFF417BFB),
                                         size: 24,),
                                           onPressed:(){
                                             showSearch(context: context, delegate: DataSearch());
                                           }),
                                     ),

                                     firstwidgetAnimator(
                                       Padding(
                                           padding: EdgeInsets.only(right: 25,left: 5),
                                          child:Align(
                                            alignment: Alignment.center,
                                            child: Badge(

                                              child:InkWell(
                                                child: Icon(Icons.notifications_active,
                                                    color: Color(0xFF417BFB)),
                                                onTap: (){
                                                  Navigator.push(context, PageTransition(child: NotificationPage(), type: PageTransitionType.rightToLeft));
                                                },
                                              ),

                                              showBadge: true,
                                              badgeColor: Colors.red,
                                              badgeContent: Text('4',
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  )),
                                            ),
                                          )
                                       )
                                     ),
                                   ],
                                   
                                   
                                   floating: true,
                                   flexibleSpace: ListView(
                                     children: <Widget>[
                                       SizedBox(height:50),
                                       Padding(
                                         padding: EdgeInsets.only(left: 10,bottom: 5,right: 10),
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: <Widget>[
                                             Text('S.O.S',style: TextStyle(
                                                 fontSize: 14.0,
                                                 fontFamily: 'Montserrat',
                                                 fontWeight: FontWeight.w300
                                             ),),
                                              FlatButton(
                                                 onPressed: (){
                                                   Navigator.push(
                                                       context, PageTransition(
                                                       child:Stories(),
                                                       type:PageTransitionType.fade
                                                   )
                                                   );
                                                 },
                                                 child: Text('Lire tout',
                                                   style: TextStyle(
                                                       fontSize: 14.0,
                                                       fontFamily: 'Montserrat',
                                                       fontWeight: FontWeight.w300
                                                   ),)
                                             )
                                           ]
                                         ),
                                         ),
                                       
                                       Padding(
                                         padding: EdgeInsets.only(left: 10,right: 10),
                                         child:Container(
                                           height: 180,
                                           child: ListView.builder(
                                               scrollDirection: Axis.horizontal,
                                               itemCount: storiesList.length,
                                               itemBuilder: (context, int index){
                                                 return storiesWidget(
                                                   storiesLIstWidget: storiesList[index],
                                                 );
                                               }
                                           ),
                                         ),
                                       ),
                                       TabBar(
                                             labelColor:  Colors.black,
                                             unselectedLabelColor: Color(0xFFAFB4C6),
                                             indicatorColor: Color(0xFF417BFB),
                                             indicatorSize: TabBarIndicatorSize.label,
                                             indicatorPadding: EdgeInsets.all(20),
                                             indicatorWeight: 1.0,
                                             labelPadding: EdgeInsets.all(15),
                                             isScrollable: true,
                                             tabs: <Widget>[
                                               Tab( child: firstwidgetAnimator(
                                                 Text('ORPHELINAT',style:
                                                 TextStyle(
                                                     fontFamily: 'Ralaway',
                                                     fontSize: 12
                                                 ),),
                                               )),
                                               Tab( child: firstwidgetAnimator(
                                                 Text('ONG & FONDATIONS',style:
                                                 TextStyle(
                                                     fontFamily: 'Ralaway',
                                                     fontSize: 12
                                                 ),),
                                               )),
                                               Tab( child: firstwidgetAnimator(
                                                 Text('DON DE SANG',style:
                                                 TextStyle(
                                                     fontFamily: 'Ralaway',
                                                     fontSize: 12
                                                 ),),
                                               )),
                                               Tab( child: firstwidgetAnimator(
                                                 Text('HOME DE VIEILLARD',style:
                                                 TextStyle(
                                                     fontFamily: 'Ralaway',
                                                     fontSize: 12
                                                 ),),
                                               )),
                                             ]
                                         ),

                                     ]
                                   ),
                                  )
                                ];
                              }, 
                              body: TabBarView(
                                children: <Widget>[
                                   Container(
                                     child: ListView.builder(
                                       itemCount: orphes.length,
                                       itemBuilder: (BuildContext context, int index){
                                         return Padding(
                                           padding: EdgeInsets.all(10),
                                           child: listWidget(
                                             orphelist: orphes[index],
                                           ),
                                         );
                                       }
                                       ),
                                   ),
                                  Container(
                                     child: ListView.builder(
                                       itemCount: fondations.length,
                                       itemBuilder: (BuildContext context, int index){
                                         return Padding(
                                           padding: EdgeInsets.all(10),
                                           child: fondation_listWidget(
                                             fondationlist: fondations[index],
                                           ),
                                         );
                                       }
                                       ),
                                   ),
                                   Container(
                                     child: Center(
                                       child: Icon(Icons.access_alarm,color: Colors.green,size: 50,)
                                     ),
                                   ),
                                   Container(
                                     child: Center(
                                       child: Icon(Icons.access_alarm,color: Colors.pink,size: 50,)
                                     ),
                                   ),

                                ]
                                )
                              )
                            ),
                           floatingActionButton:
                             InkWell(
                               onTap: (){
                                 showDialog<String>(
                                     barrierDismissible: true,
                                     context:context,
                                     builder: (BuildContext context)=>
                                        firstwidgetAnimator(SimpleDialog(
                                          children: <Widget>[
                                            firstwidgetAnimator(ListTile(
                                              leading: Icon(Icons.person, color: Color(0xFF417BFB), size: 20,),
                                              title: Text('Mon compte',
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey
                                                ),
                                              ),
                                              onTap: (){
                                                Navigator.push(
                                                    context, PageTransition(
                                                    child:ProfilePage(),
                                                    type: PageTransitionType.rightToLeft
                                                )
                                                );
                                              },
                                            )),
                                            Divider(),
                                            firstwidgetAnimator(ListTile(
                                              leading: Icon(Icons.settings, color: Color(0xFF417BFB), size: 20,),
                                              title:Text('Paramettres',
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ) ,
                                              onTap: (){
                                                Navigator.push(
                                                    context, PageTransition(
                                                    child:SettingsPage(),
                                                    type: PageTransitionType.rightToLeft
                                                )
                                                );
                                              },
                                            )),
                                            Divider(),
                                            firstwidgetAnimator(ListTile(
                                              leading: Icon(Icons.announcement, color: Color(0xFF417BFB), size: 20,),
                                              title:Text('Apropos de Nous',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ) ,
                                              onTap: (){
                                                Navigator.push(
                                                    context, PageTransition(
                                                    child:AboutPage(),
                                                    type: PageTransitionType.rightToLeft
                                                )
                                                );
                                              },
                                            )),

                                          ],
                                        ))
                                 );
                               },
                               child: Container(
                                 width: 70,
                                 height: 70,
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
                                     child: Icon(Icons.filter_list, color: Colors.white),
                                   ),
                                 ),
                               ),
                             )


                        )

                     ),
                   ) ;


             }
         );


  }


  }



