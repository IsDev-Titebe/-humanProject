import 'package:human_project_app/Models/orphelinat_models.dart';
import 'package:human_project_app/pages/list_scaffold.dart';
import 'package:human_project_app/service/circle_image.dart';
import'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:avatar_glow/avatar_glow.dart';


final Color backgroundColor = Color(0xFF4A4A58);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with TickerProviderStateMixin{
  PageController _pageController;
  Animation <double>_scaleAnimation;
  AnimationController _controller;
  AnimationController _homecontroller;
  Animation <Offset>  _slideAnimation;


  Animation <double>_scaleRippleAnimation;
  AnimationController _ripplecontroller;

  AnimationController _menuController;
  Animation <double>  _menuAnimation,_menuTextAnimation;

  Animation <Offset> _homeimgAnimation;



  bool isCollapsed = true;
  double screenWidth,screenHeight;
  final Duration duration = const Duration(milliseconds: 300);


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    _homecontroller = AnimationController(vsync: this,duration: Duration(seconds: 2));


    // Animation scale page for Menu
    _scaleAnimation = Tween <double> (begin:1 ,end:0.6 ).animate(_controller);
    _slideAnimation = Tween <Offset> (begin:Offset(-1, 0) ,end:Offset(0,0) ).animate(_controller);


    //animation Menu page
    _menuController = AnimationController(vsync: this,duration:Duration(seconds: 3));

    _menuAnimation = Tween<double>(begin: -1.0,end: 0.0)
        .animate(CurvedAnimation(parent: _menuController, curve:Interval(0.3, 1.0,curve: Curves.fastLinearToSlowEaseIn)));

    _menuTextAnimation = Tween<double>(begin: -1.0,end: 0.0)
        .animate(CurvedAnimation(parent: _menuController, curve: Curves.fastLinearToSlowEaseIn));

    // animation PageController
    _pageController = PageController(initialPage: 1,viewportFraction: 0.8);


    // animation ripple button
    _ripplecontroller = AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    _scaleRippleAnimation = Tween<double>(begin: 1.0,end: 30.0).animate(_ripplecontroller)
      ..addStatusListener((status){
        if(status == AnimationStatus.completed){
          _ripplecontroller.reverse();
        } else if(status == AnimationStatus.dismissed){
          _ripplecontroller.forward();
        }
      });

    //animation Homepage

    _homeimgAnimation = Tween <Offset> (begin:Offset(-2, 0) ,end:Offset(0,0) )
        .animate(CurvedAnimation(parent: _homecontroller, curve: Curves.fastLinearToSlowEaseIn));


    //all animation forward
    _ripplecontroller.forward();
    _homecontroller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _orpheList(index){
    return AnimatedBuilder(
      animation: _pageController,
      builder:(BuildContext context, Widget widget){
        double value = 1;
        if(_pageController.position.haveDimensions){
          value = _pageController.page - index;
          value =(1-(value.abs()*0.3)+0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value)*135.0,
            width: Curves.easeInOut.transform(value)*350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: (){},
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                constraints: BoxConstraints(),
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0, vertical: 20.0,
                ),
                height: 125.0,
                width: 275.0,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0,
                      )
                    ]
                ) ,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white
                  ),
                  child:Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage(
                                    orphes[index].img
                                ),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black.withOpacity(0.6)
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15,
                            bottom: 20
                        ),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(orphes[index].name,
                                  style: TextStyle(
                                      color:Colors.white,
                                      fontFamily: 'aladin',
                                      letterSpacing:0.9,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  height: 20,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.white
                                      )
                                  ),
                                  child: Center(
                                    child: Text('Orphe',style:TextStyle(
                                      color: Colors.cyan,
                                      fontFamily: 'aladin',
                                    )),
                                  ),
                                )

                              ],
                            ),

                            SizedBox(height: 5),
                            Row(
                              children: <Widget>[
                                Icon(Icons.location_on,color: Colors.white,size: 16,),
                                SizedBox(width: 3),
                                Text(orphes[index].localisation,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'aladin',
                                      color: Colors.white,
                                      letterSpacing: 0.7
                                  ),),
                                SizedBox(width: 25),
                                Icon(Icons.child_care,color: Colors.white,size: 16,),
                                SizedBox(width: 4),
                                Text(orphes[index].nombres,
                                  style: TextStyle(
                                      fontFamily: 'aladin',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      letterSpacing: 0.7
                                  ),),
                              ],
                            ),
                            SizedBox(height:10),
                            Padding(
                              padding: EdgeInsets.only(right: 180,left: 10),
                              child:Container(
                                color: Colors.cyan,
                                height: 2,
                              ) ,
                            )

                          ],
                        ) ,
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


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context)
        ],
      ),
    );
  }
  Widget menu(context){
    final width = MediaQuery.of(context).size.width;
    return SlideTransition(
        position:_slideAnimation,
        child: Container(
          padding: EdgeInsets.only(top: 150, left: 32,bottom: 20,
              right: MediaQuery.of(context).size.width/2.9),
          child: Column(
            children: <Widget>[
              AnimatedBuilder(
                animation: _menuController,
                builder: (context, child) =>
                    Row(
                      children: <Widget>[
                        Transform(
                          transform: Matrix4.translationValues(_menuAnimation.value*width, 0.0, 0.0),
                          child:Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: CircularImage(
                                  AssetImage('Assets/img_isaac.jpg')
                              )
                          ),
                        ),
                        Transform(
                            transform: Matrix4.translationValues(_menuTextAnimation.value*width, 0.0, 0.0),
                            child:Text('Héllo, titebe',
                              style: TextStyle(
                                fontFamily: 'josefin',
                                color: Colors.black54,
                                fontWeight: FontWeight.w300,
                                fontSize: 17,
                              ),
                            )
                        ),
                      ],
                    ),
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  ListTile(
                    onTap: (){
                    },
                    leading: Icon(Icons.child_care, color: Colors.black54, size: 20,),
                    title: Text('Orphelinat',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'aladin',
                          fontWeight: FontWeight.w400,
                          color: Colors.black54
                      ),
                    ),
                  ),

                  ListTile(
                    onTap: (){
                    },
                    leading: Icon(Icons.hotel, color: Colors.black54, size: 20,),
                    title: Text('home de veillard',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                          fontFamily:'aladin'
                      ),
                    ),
                  ),

                  ListTile(
                    onTap: (){

                    },
                    leading: Icon(Icons.directions_walk, color: Colors.black54, size: 20),
                    title: Text('Maison d\'aveugle',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                          fontFamily:'aladin'
                      ),
                    ),
                  ),

                  ListTile(
                    onTap: (){
                    },
                    leading: Icon(Icons.accessible, color: Colors.black54, size: 20,),
                    title: Text('Maison D\'endicapet',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                          fontFamily:'aladin'
                      ),
                    ),
                  ),

                  ListTile(
                    onTap: (){
                    },
                    leading: Icon(Icons.domain, color: Colors.black54, size: 20,),
                    title: Text('Ong',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                          fontFamily:'aladin'
                      ),
                    ),
                  ),
                ],

              ),

              Spacer(),

              ListTile(
                onTap: (){

                },
                leading: Icon(Icons.search, color: Colors.red, size: 20,),
                title: Text('Récherche',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45
                    )),),
              ListTile(
                onTap: (){

                },
                leading: Icon(Icons.help, color: Colors.green, size: 20,),
                title: Text('Apropos',
                    style: TextStyle(
                        fontSize: 16,
                        color:Colors.black45
                    )),),
            ],
          ),
        )
    );
  }

  Widget dashboard(context){
    final width = MediaQuery.of(context).size.width;

    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.5 * screenWidth,
      right: isCollapsed ? 0 : -0.3 *screenWidth,
      child:ScaleTransition(
          scale:_scaleAnimation,
          child:Container(
              decoration: new BoxDecoration(
                  boxShadow:[
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0.0, 10.0),
                        blurRadius: 15.0
                    )
                  ]
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Scaffold(
                    body: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('Assets/img_maps.jpg',),fit: BoxFit.cover
                              )
                          ),
                        ), //content google maps
                        Container(
                          padding: EdgeInsets.only(left: 16,right: 16,top: 25),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  InkWell(
                                    child: SlideTransition(
                                      position: _homeimgAnimation,
                                      child:Container(
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black38,
                                                    offset: Offset(2.0,5.0),
                                                    blurRadius: 20.0
                                                )
                                              ]
                                          ),
                                          child: Stack(
                                            children: <Widget>[
                                              CircleAvatar(
                                                backgroundImage: AssetImage('Assets/img_isaac.jpg'),
                                              ),
                                              Positioned(
                                                right: 0,
                                                bottom: 0,
                                                child:Container(
                                                  width: 10,
                                                  height: 10,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(50),
                                                      color: Colors.lightGreen
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                    ),
                                    onTap: (){
                                      setState(() {
                                        if(isCollapsed){
                                          _controller.forward();
                                          _menuController.forward();
                                        }else {
                                          _controller.reverse();
                                          _menuController.reverse();
                                        }

                                        isCollapsed = !isCollapsed;
                                      });
                                    },
                                  ),
                                  Center(
                                    child:Container(
                                      child: RichText(
                                          text: TextSpan(
                                              text: 'Save',
                                              style: TextStyle(
                                                letterSpacing: 0.6,
                                                fontFamily: 'aladin',
                                                fontSize: 20,
                                                color: Colors.cyan,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              children:<TextSpan>[
                                                TextSpan(
                                                    text: 'children!',
                                                    style: TextStyle(color: Colors.indigo,letterSpacing: 0.6,fontFamily: 'aladin',fontWeight: FontWeight.w700)
                                                )
                                              ]
                                          )
                                      ),
                                    ),

                                  ),
                                  Row(
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          Icon(Icons.notifications_active),
                                          Positioned(
                                              top: 0,
                                              left: 9,
                                              child:Container(
                                                  width: 15,
                                                  height: 15,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(50),
                                                      color: Colors.red
                                                  ),
                                                  child: Center(
                                                    child:Text('3',style: TextStyle(
                                                        color: Colors.white
                                                    ),),
                                                  )

                                              )
                                          )
                                        ],
                                      ),
                                      PopupMenuButton(
                                          itemBuilder: (BuildContext context){
                                            return [
                                              PopupMenuItem(child: ListTile(
                                                leading: Icon(Icons.hotel,color: Colors.cyan,),
                                                title: Text('home de vieillard',style: TextStyle(
                                                    fontFamily:'aladin',
                                                    fontSize: 15
                                                ),),
                                                onTap: (){},

                                              )),
                                              PopupMenuItem(child: ListTile(
                                                leading: Icon(Icons.directions_walk,color: Colors.cyan,),
                                                title: Text('Maison d\'aveugle',style: TextStyle(
                                                    fontFamily:'aladin',
                                                    fontSize: 15
                                                ),),
                                                onTap: (){},
                                              )),
                                              PopupMenuItem(child: ListTile(
                                                leading: Icon(Icons.accessible,color: Colors.cyan,),
                                                title: Text('Maison d\'andicapet',style: TextStyle(
                                                    fontFamily:'aladin',
                                                    fontSize: 15
                                                ),),
                                                onTap: (){},
                                              )),
                                              PopupMenuItem(child: ListTile(
                                                leading: Icon(Icons.domain,color: Colors.cyan,),
                                                title: Text('Ong & Fondation',style: TextStyle(
                                                    fontFamily:'aladin',
                                                    fontSize: 15
                                                ),),
                                                onTap: (){},
                                              )),

                                            ];
                                          }
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            bottom: 10.0,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 200.0,
                                  width: MediaQuery.of(context).size.width,
                                  child: PageView.builder(
                                      controller: _pageController,
                                      itemCount: orphes.length ,
                                      itemBuilder: (BuildContext context, int index){
                                        return _orpheList(index);
                                      }
                                  ),
                                )
                              ],
                            )
                        ),
                        Positioned(
                          top: 100.0,
                          left: 15.0,
                          right: 15.0,
                          child: Container(
                            height: 50.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 4.0),
                                    blurRadius: 10.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Récherche',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left:25.0,top: 15.0),
                                  suffixIcon: IconButton(
                                      icon: Icon(Icons.location_on),
                                      onPressed: (){}
                                  )
                              ),
                            ),
                          ),

                        ),
                        makerPoint(top:170.0,left:40.0,color: Colors.purple),
                        makerPoint(top:350.0,left:200.0,color: Colors.teal),
                        makerPoint(top:155.0,left:150.0,color: Colors.white),
                        makerPoint(top:260.0,left:280.0,color: Colors.red),
                        makerPoint(top:450.0,left:290.0,color: Colors.cyan),
                        makerPoint(top:380.0,left:25.0,color: Colors.cyan),
                        makerPoint(top:300.0,left:115.0,color: Colors.cyan),
                        makerPoint(top:280.0,left:215.0,color: Colors.cyan),
                        makerPoint(top:370.0,left:315.0,color: Colors.cyan),
                        makerPoint(top:200.0,left:325.0,color: Colors.cyan),
                        makerPoint(top:400.0,left:125.0,color: Colors.cyan),
                        Positioned(
                          bottom: 150,
                          left: 10.0,
                          right: 10.0,
                          child: Container(
                            width: 150,
                            height: 150,
                            child:GestureDetector(
                              child:Icon(Icons.keyboard_arrow_up,size: 25,color: Colors.grey),
                              onTapUp:(detail){
                                Navigator.push(context, PageTransition(child: listTab(), type:PageTransitionType.downToUp));
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              )
          )
      ),

    );
  }

  Widget makerPoint({color,top,left}){
    return Positioned(
        top: top,
        left: left,
        child: AvatarGlow(
            startDelay: Duration(milliseconds: 1000),
            duration: Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            glowColor: color,
            repeatPauseDuration: Duration(milliseconds: 100),
            child: Material(
              elevation: 8,
              shape: CircleBorder(),
              child: CircleAvatar(
                child: Icon(Icons.location_on,color: Colors.white54),
                radius: 16,
                backgroundColor: color,
              ),
            ),
            endRadius: 90)

    );
  }


}

