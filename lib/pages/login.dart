import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:human_project_app/pages/list_scaffold.dart';
import 'package:human_project_app/service/bouce_animation.dart';
import 'package:human_project_app/service/first_animation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  static const menuItems = <String>['+243','+242'];
  final List <DropdownMenuItem<String>> _dropDownMenuItems =
  menuItems.map((String value) =>DropdownMenuItem <String>(
    value: value,
    child: Text(value,style: TextStyle(fontFamily: 'aladin',fontSize: 13,color: Colors.grey)),
  )).toList();

  String _btnSelectedCode = '+243';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('Assets/loginScreen2.jpg'),fit: BoxFit.cover,)
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff5880B0).withOpacity(.4),
                          Color(0xff103860).withOpacity(.9)
                        ]
                    )
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      firstwidgetAnimator(
                        CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.2),
                            radius: 50.0,
                            child: Text('logo',style: TextStyle(
                                fontFamily: 'Releway',
                                color: Colors.white,
                                fontSize: 24
                            ),)
                        ),
                      ),
                      firstwidgetAnimator(
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                                width: 20.0,
                                height: 5.0),
                            Container(
                              child: Center(
                                child: Text('Save',style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.white.withOpacity(.7)
                                ),
                                ),
                              ),
                            ),
                            Container(width: 10),
                            RotateAnimatedTextKit(
                              onTap: (){},
                              text: [
                                ' Children',
                                ' Humanity',
                                ' forward',
                              ],
                              textStyle: TextStyle(
                                  fontFamily: 'Releway',
                                  fontSize: 24.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center,
                              alignment: AlignmentDirectional.topStart,
                            )
                          ],
                        ),
                      ),
                      firstwidgetAnimator(
                        Container(
                          height: 160,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left:10,right: 10,top: 15,bottom: 15),
                            child:Column(
                              children: <Widget>[
                                Text('Configurez avec votre numero de télephone, vous receverez un sms avec un code de confirmation',
                                    textAlign:TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Releway'
                                    )),
                                SizedBox(height: 5),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                        flex:1,
                                        child: DropdownButton<String>(
                                          items: this._dropDownMenuItems,
                                          onChanged:(String newValue){
                                            setState(() {
                                              _btnSelectedCode = newValue;
                                            });
                                          },
                                          value: _btnSelectedCode,
                                        )
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          child: TextField(
                                            keyboardType: TextInputType.phone,
                                            style: TextStyle(
                                                fontFamily: 'Releway',
                                                color: Colors.white
                                            ),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: '852963659',
                                                hintStyle: TextStyle(color: Colors.white.withOpacity(.5))

                                            ),
                                          ),
                                        )
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      firstwidgetAnimator(
                          BouncingWidget(
                              duration: Duration(milliseconds: 100),
                              scaleFactor: 1.5,
                              onPressed: () {
                                Navigator.pushReplacement(context, PageTransition(child: listTab(),type: PageTransitionType.fade));
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.white
                                    )
                                ),
                                child: Center(
                                  child: Text('Confirmer',style:
                                  TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Releway'

                                  ),),
                                ),
                              )

                          )
                      ),
                      SizedBox(height: 15),
                      Column(
                        children: <Widget>[
                          firstwidgetAnimator(
                            Text('-  OU  -',style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Releway',
                            ),),
                          ),
                          SizedBox(height: 15),
                          firstwidgetAnimator(
                            Text('Se connecter avec',style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Releway',
                            ),),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      firstwidgetAnimator(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              BouncingWidget(
                                duration: Duration(milliseconds: 100),
                                scaleFactor: 1.5,
                                onPressed: () {
                                  AlertDown();
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.white
                                      )
                                  ),
                                  child: Align(
                                      alignment: Alignment.bottomRight,
                                      child:Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child:Icon(MdiIcons.facebook,color: Colors.white,size: 35)
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(width: 25),
                              BouncingWidget(
                                duration: Duration(milliseconds: 200),
                                scaleFactor: 1.5,
                                onPressed: () {
                                  AlertDown();
                                
                                },
                                child:  Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.white
                                      )
                                  ),
                                  child: Center(
                                    child: Icon(MdiIcons.googlePlus,color:Colors.red,
                                    size: 35,)
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),

                    ],
                  ),
                ),
              )
            ])
    );

  }

Widget AlertDown(){
  return Material(
    color: Colors.black87,
    child: InkWell(
      onTap:() {
        Navigator.pop(context);
        },
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
                  height: 150,
                  child: BouncewidgetAnimator(
                    Center(
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 40,
                            right: 10,
                            left: 10,
                            bottom: 10
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('C\'est Pour Bientot!!! \n Widget détaché'
                                    ,textAlign: TextAlign.center
                                    ,style:TextStyle(
                                     fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Releway'
                               )),
                            ],
                          ),
                        ),
                      )  
                  )),
                ),
              ),
              Positioned(
               top: 5,
               right: 0,
               left: 0,
               child: BouncewidgetAnimator(Container(
                    height: 100,
                    width: 100,
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
                               Icon(Icons.mood,
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
    ),
  );
}






}
