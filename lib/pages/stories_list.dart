import 'package:flutter/material.dart';
import 'package:human_project_app/Models/stories_models.dart';
import 'package:human_project_app/service/first_animation.dart';
import 'package:human_project_app/widgets/stories_detail_widget.dart';


class Stories extends StatefulWidget {


  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.grey.withOpacity(0.3),
                          Colors.grey.withOpacity(0.6)
                        ]
                    )
                ),
              ),
              SafeArea(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15,right: 20),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          firstwidgetAnimator(IconButton(
                              icon: Icon(Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 20),
                              onPressed: (){
                                Navigator.pop(context);
                              })),
                          firstwidgetAnimator(IconButton(
                              icon: Icon(Icons.more_vert,
                                  color: Colors.white,
                                  size: 20),
                              onPressed: (){

                              }),),
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: storiesList.length,
                            itemBuilder: (BuildContext context, int index){
                              return StoriesDetail(
                                Detail: storiesList[index],
                              );
                            }
                        )
                    )
                  ],
                ),
              )
            ],
          ),
        );
  }
}

