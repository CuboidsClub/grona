import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grona/common/services/Authentication.dart';
import 'package:grona/common/services/BaseWidget.dart';
import 'package:grona/common/services/Navigation.dart';
import 'package:grona/constant.dart';
import 'package:grona/locator.dart';

class StartUpViewModel extends BaseWidget  {
  Future handleLogic() async {
    final Navigation _navigation = locator<Navigation>();
    var userLoggedInOrNot = await Authentication().handleLogin();
    if (userLoggedInOrNot) {
      FirebaseUser _user = await FirebaseAuth.instance.currentUser();
      DocumentSnapshot documentReference = await Firestore.instance.collection('customer').document(_user.phoneNumber).get();
      DocumentSnapshot documentReference2 = await Firestore.instance.collection('Testing-merchant').document(_user.phoneNumber).get();
      if(documentReference.exists && documentReference2.exists){
        _navigation.replaceNavigateTo(RoleNavigationRoute);
      }else if(documentReference.exists){
        _navigation.replaceNavigateTo(CustomerHomeRoute);
      }else if(documentReference2.exists){
        _navigation.replaceNavigateTo(HomeViewRoute);
      }
      else{
        _navigation.replaceNavigateTo(RoleRoute);
      }
    } else {
      _navigation.replaceNavigateTo(LoginViewRoute);
    }
  }
}