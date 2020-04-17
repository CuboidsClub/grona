import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:grona/common/Ui/LoginPage.dart';
import 'package:grona/constant.dart';
import 'package:grona/merchant/home.dart';

Route<dynamic> generateRoute(RouteSettings settings){
switch (settings.name){
  case LoginViewRoute:
    return _getPageRoute(
      routeName: LoginViewRoute,
      viewToShow: LoginPage()
    );

  case HomeViewRoute:
    return _getPageRoute(
      routeName: HomeViewRoute,
      viewToShow: Home()
    );

  case OtpViewRoute:
    var information = settings.arguments;
    return _getPageRoute(
      routeName: OtpViewRoute,
      viewToShow: Otp(information: information),
    );

  default:
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
              child: Text('No route defined for ${settings.name}')),
        ));
}
}

PageRoute _getPageRoute({String routeName,Widget viewToShow}){
  return MaterialPageRoute(
    settings: RouteSettings(name: routeName),
    builder: (_) => viewToShow
  );
}