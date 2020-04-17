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

    final PhoneVerificationCompleted verificationSuccess = (AuthCredential authResult){
      _auth.signInWithCredential(authResult);
    };

    final PhoneVerificationFailed verificationFailed = (AuthException exception){
      _showDialog.showDialog(title: 'Opertion failed',description: exception.message,buttonTitle: 'OK');
    };

    final PhoneCodeSent codeSend = (String verId,[int forceResend]){
      this.verificationId = verId;
      Map information = {'verid':verId,'phone':phone};
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
}