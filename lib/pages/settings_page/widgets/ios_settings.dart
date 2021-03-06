import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_settings/flutter_cupertino_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/theme/theme_bloc.dart';

class IOSSettings extends StatefulWidget {
  final ThemeState theme;
  IOSSettings({this.theme});

  @override
  _IOSSettingsState createState() => _IOSSettingsState();
}

class _IOSSettingsState extends State<IOSSettings> {
  //TODO: Add functionality to the iOS settings page
  @override
  Widget build(BuildContext context) {
    var themeBloc = context.bloc<ThemeBloc>();
    var isSwitched = widget.theme.isDarkMode;
    return CupertinoSettings(items: <Widget>[
      const CSHeader('General'),
      CSControl(
        nameWidget: Text('Dark Mode'),
        contentWidget: CupertinoSwitch(
          value: isSwitched,
          onChanged: (value) {
            isSwitched = value;
            themeBloc.add(ThemeEvent.toggle);
          },
        ),
        style: CSWidgetStyle(
            icon: Icon(Icons.brightness_medium,
                color: Theme.of(context).hoverColor)),
      ),
      const CSHeader('Feedback'),
      CSLink(
        title: 'Send Feedback',
      ),
      CSLink(
        title: 'Rate this app',
      ),
      const CSHeader('About'),
      CSLink(
        title: 'FAQ',
      ),
      CSLink(
        title: 'GitHub Repo',
      ),
      CSLink(
        title: 'Privacy Policy',
      ),
      CSControl(
          nameWidget: Text('Version'),
          contentWidget: Text(
            '1.0.0',
            style: TextStyle(color: Colors.grey),
          )),
    ]);
  }
}
