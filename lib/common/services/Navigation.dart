import 'package:flutter/material.dart';

class Navigation{

GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

GlobalKey<NavigatorState> get navigationKey => _navigationKey;

bool pop() {
  return _navigationKey.currentState.pop();
}

Future<dynamic> navigateTo(String routeName,{dynamic arguments}){
  return _navigationKey.currentState.pushNamed(routeName,arguments:arguments);
}

Future<dynamic> replaceNavigateTo(String routeName,{dynamic arguments}){
  return _navigationKey.currentState.pushReplacementNamed(routeName,arguments:arguments);
}

Future<dynamic> replaceAllNavigateTo(String routeName,{dynamic arguments}){
  return _navigationKey.currentState.pushNamedAndRemoveUntil(routeName,(Route<dynamic> route)=>false);
}

}