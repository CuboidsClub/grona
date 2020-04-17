import 'package:grona/common/services/Authentication.dart';
import 'package:grona/common/services/BaseWidget.dart';
import 'package:grona/common/services/Navigation.dart';
import 'package:grona/constant.dart';
import 'package:grona/locator.dart';

class StartUpViewModel extends BaseWidget {
  Future handleLogic() async {
    final Navigation _navigation = locator<Navigation>();
    var userLoggedInOrNot = await Authentication().handleLogin();
    if (userLoggedInOrNot) {
      _navigation.replaceNavigateTo(HomeViewRoute);
    } else {
      _navigation.replaceNavigateTo(LoginViewRoute);
    }
  }
}