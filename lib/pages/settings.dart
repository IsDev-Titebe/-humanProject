import 'package:flutter/material.dart';
import 'package:human_project_app/service/first_animation.dart';
import'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  
  bool value = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsList(
           sections: [
             SettingsSection(
               title: 'Section1',
               tiles: [
                 SettingsTile(
                     title: 'langue',
                     subtitle: 'Francais',
                     leading: Icon(Icons.language),
                   onTap: (){},
                 ),
                 SettingsTile.switchTile(
                     title: 'Use fingerprint',
                     leading: Icon(Icons.fingerprint),
                     onToggle: (bool value){}, 
                     switchValue: value
                 )
               ],
             )
           ],
      ),
    );
  }
}
