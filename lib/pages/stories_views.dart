import 'package:flutter/material.dart';
import 'package:human_project_app/Models/stories_models.dart';
import 'package:human_project_app/service/first_animation.dart';
import 'package:story_view/story_controller.dart';
import 'package:story_view/story_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class StoriesView extends StatelessWidget {
  
  final stories views;

  const StoriesView({this.views});
  
  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    final  List<StoryItem> storyItems =[
        StoryItem(
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(views.imgSecond),
                        fit: BoxFit.cover
                    )
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            const Color(0x00000000),
                            const Color(0xD9333333),
                          ],
                        stops: [
                          0.0,
                          0.9
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(0.0, 1.0)
                      )
                    )
                ),
                // here Position retired
                Positioned(
                    top:MediaQuery.of(context).size.height/2+160.0,
                    left: 25.0,
                    right: 25.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        firstwidgetAnimator(Container(
                          width: MediaQuery.of(context).size.width - 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(views.localisation + ',  ' + views.city,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      decoration: TextDecoration.none,
                                      fontSize: 17.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Icon(Icons.location_on, color: Colors.white, size: 17.0),
                            ],
                          ),
                        )),
                        SizedBox(height: 10.0),
                        firstwidgetAnimator(Container(
                          height: 2.0,
                          color: Colors.white,
                        )),
                        SizedBox(height: 15.0),
                        firstwidgetAnimator(
                           Text(views.title,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      decoration: TextDecoration.none,
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 10.0),
                        firstwidgetAnimator( Container(
                          width: MediaQuery.of(context).size.width - 100.0,
                          child: Text(
                              'Join us for a fun, relaxed and intimate experience of the majestic Geirangerfiord. Whatever the weather is like or whatever previous paddling experience you have.',
                              style: TextStyle(
                                fontFamily: 'Releway',
                                letterSpacing: 0.6,
                                fontSize: 14.0,
                                decoration: TextDecoration.none,
                                color: Colors.white,
                              )),
                        ))


                      ],
                    )
                )
              ],
            ),
          ),
          duration: Duration(seconds: 5),
          shown: false
        ),
        StoryItem(
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(views.imgThird),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0x00000000),
                              const Color(0xD9333333),
                            ],
                            stops: [
                              0.0,
                              0.9
                            ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(0.0, 1.0)
                        )
                    )
                ),
                // here Position retired
                Positioned(
                    top:MediaQuery.of(context).size.height/2+160.0,
                    left: 25.0,
                    right: 25.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        firstwidgetAnimator(Container(
                          width: MediaQuery.of(context).size.width - 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(views.localisation + ',  ' + views.city,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      decoration: TextDecoration.none,
                                      fontSize: 17.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Icon(Icons.location_on, color: Colors.white, size: 17.0),
                            ],
                          ),
                        )),
                        SizedBox(height: 10.0),
                        firstwidgetAnimator(Container(
                          height: 2.0,
                          color: Colors.white,
                        )),
                        SizedBox(height: 15.0),
                        firstwidgetAnimator(
                          Text(views.title,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.none,
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 10.0),
                        firstwidgetAnimator( Container(
                          width: MediaQuery.of(context).size.width - 100.0,
                          child: Text(
                              'Join us for a fun, relaxed and intimate experience of the majestic Geirangerfiord. Whatever the weather is like or whatever previous paddling experience you have.',
                              style: TextStyle(
                                fontFamily: 'Releway',
                                letterSpacing: 0.6,
                                fontSize: 14.0,
                                decoration: TextDecoration.none,
                                color: Colors.white,
                              )),
                        ))


                      ],
                    )
                )
              ],
            ),
          ),
          duration: Duration(seconds: 5),
          shown: false
      ),
    ];
    return StoryView(
      storyItems,
      controller: controller,
      inline: false,
      repeat: false,
      onComplete: () {
        Navigator.pop(context,true);
      },
    );
  }

}
