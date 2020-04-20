import 'package:firebase_auth/firebase_auth.dart';
import 'package:grona/common/services/Authentication.dart';
import 'package:grona/common/services/BaseWidget.dart';
import 'package:grona/common/services/Navigation.dart';
import 'package:grona/common/services/dialog.dart';
import 'package:grona/constant.dart';
import 'package:grona/locator.dart';

class LoginPageViewModel extends BaseWidget {
  String  verificationId, smsCode;
  bool codeSent = false;
  Authentication _auth = locator<Authentication>();
  Navigation _navigation = locator<Navigation>();
  ShowDialog _showDialog = locator<ShowDialog>();

  Future<void> createUserWithPhone(phone)async{
     setBusy(true);
    final PhoneVerificationCompleted verificationSuccess = (AuthCredential authResult){
      _auth.signInWithCredential(authResult);
    };

    final PhoneVerificationFailed verificationFailed = (AuthException exception){
      setBusy(false);
      _showDialog.showDialog(title: 'Opertion failed',description: exception.message,buttonTitle: 'OK');
    };

    final PhoneCodeSent codeSend = (String verId,[int forceResend]){
      this.verificationId = verId;
      Map information = {'verid':verId,'phone':phone};
      setBusy(false);
      _navigation.replaceNavigateTo(OtpViewRoute,arguments: information);
    };

    final PhoneCodeAutoRetrievalTimeout codeRetrievalTimeout = (String verId){
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: verificationSuccess,
        verificationFailed: verificationFailed,
        codeSent: codeSend,
        codeAutoRetrievalTimeout: codeRetrievalTimeout
    );
  }

  //Sign-in with opt
  Future signInWithOTP(smsCode, verId)async{
    setBusy(true);
    try{
      AuthCredential authCredential = PhoneAuthProvider.getCredential(
          verificationId: verId, smsCode: smsCode);
      await _auth.signInWithCredential(authCredential);
      setBusy(false);
    }catch(e){
      _showDialog.showDialog(title: 'Opertion Failed',description: e.message,buttonTitle: 'OK');
    }

  }
}