import 'dart:async';

import 'package:flutter/material.dart';

class BounceAnimator extends StatefulWidget {

  final Widget child;
  final Duration time;

  BounceAnimator(this.child,this.time);

  @override
  _BounceAnimatorState createState() => _BounceAnimatorState();
}

class _BounceAnimatorState extends State<BounceAnimator> with
    SingleTickerProviderStateMixin{

  Timer timer;
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(seconds: 1),vsync: this);
    animation = Tween<double>(begin: 0.0,end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.elasticInOut));
    timer = Timer(widget.time, animationController.forward);

  }


  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        child: widget.child,
        builder: (BuildContext context,Widget child) {
          return Transform.scale(
              scale:animation.value,
              child: child,
            );
        }
    );
  }
}


Timer timer;
Duration duration = Duration();
wait(){
  if(timer == null || !timer.isActive ) {
    timer = Timer(Duration(seconds: 3),(){
      duration = Duration();
    });
  }
  duration += Duration(milliseconds: 300);
  return duration;
}
class BouncewidgetAnimator extends StatelessWidget {

  final Widget child;
  BouncewidgetAnimator( this.child);


  @override
  Widget build(BuildContext context) {
    return BounceAnimator(child, wait());
  }
}
