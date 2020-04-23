import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grona/common/services/Navigation.dart';
import 'package:grona/common/services/dialog.dart';
import 'package:grona/constant.dart';
import 'package:grona/locator.dart';

class Authentication {
  final _auth = FirebaseAuth.instance;
  ShowDialog _dialog = locator<ShowDialog>();
  Navigation _navigation = locator<Navigation>();

  //IS User logged-in or not
  Future<bool> handleLogin()async{
    FirebaseUser user = await _auth.currentUser();
    return user != null;
  }

  //Sign-in with authCredential
  Future signInWithCredential(AuthCredential authCredential)async{
    try{
      await _auth.signInWithCredential(authCredential);
      FirebaseUser _user = await _auth.currentUser();
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
    }catch(e){
      _dialog.showDialog(title: 'Opertion Failed',description: e.message,buttonTitle: 'OK');
    }
  }


  //Sign-out
  Future signOut()async{
    await _auth.signOut();
    _navigation.replaceNavigateTo(LoginViewRoute);
  }
  
}