import 'package:flutter/material.dart';
import 'package:grona/common/Ui/StartUpView.dart';
import 'package:grona/common/Ui/dialogManagar.dart';
import 'package:grona/common/services/Navigation.dart';
import 'package:grona/locator.dart';
import 'package:grona/router.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        title: 'Grona',
        builder: (context, widget) => Navigator(
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => ShowDialogManager(
                      child: widget,
                    ))),
        navigatorKey: locator<Navigation>().navigationKey,
        onGenerateRoute: generateRoute,
        home: StartUpView());
  }
}
