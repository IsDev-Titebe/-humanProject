import 'package:flutter/material.dart';
import 'package:human_project_app/service/first_animation.dart';



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            firstwidgetAnimator(
              Icon(Icons.mood,color: Colors.green,size: 100.0),
            ),
            SizedBox(height: 15),
            firstwidgetAnimator(
                Text('C\'est Pour Bientot',
                  style: TextStyle(
                      letterSpacing: 5,
                      fontFamily: 'Releway',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),)
            ),
            firstwidgetAnimator(
                Text('Page en construction',
                  style: TextStyle(
                      fontFamily: 'Releway',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600
                  ),)
            ),
          ],
        ),
      ),
    );
  }
}

