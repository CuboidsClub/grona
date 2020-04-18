import 'package:url_launcher/url_launcher.dart';

class CartPageModel{
  launchCaller(number) async {
    var url = "tel:" +number;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}