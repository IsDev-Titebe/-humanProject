import 'package:flutter/material.dart';


class TabText extends StatelessWidget {

  final bool isSelected;
  final String text;
  final Function onTabTap;

  const TabText({this.isSelected, this.text, this.onTabTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTabTap,
      child: Text(text, style:
        TextStyle(
            fontFamily: 'aladin',
            fontSize: 12
        ),
      ),
    );
  }
}
