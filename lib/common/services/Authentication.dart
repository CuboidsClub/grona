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
      _navigation.replaceNavigateTo(HomeViewRoute);
    }catch(e){
      _dialog.showDialog(title: 'Opertion Failed',description: e.message,buttonTitle: 'OK');
    }
  }

   //Sign-in with opt
  Future signInWithOTP(smsCode, verId)async{
    try{
      AuthCredential authCredential = PhoneAuthProvider.getCredential(
          verificationId: verId, smsCode: smsCode);
      signInWithCredential(authCredential);
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