import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';

class ConsumerAccount extends StatefulWidget {
  @override
  _ConsumerAccountState createState() => _ConsumerAccountState();
}

class _ConsumerAccountState extends State<ConsumerAccount> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            ShapeOfView(
              child: Container(
                padding: EdgeInsets.only(top: 60),
                color: Colors.blue,
                alignment: Alignment.center,
              ),
              elevation: 4,
              height: 200,
              shape: DiagonalShape(
                  position: DiagonalPosition.Bottom,
                  direction: DiagonalDirection.Left,
                  angle: DiagonalAngle.deg(angle: 20)),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 75, left: MediaQuery.of(context).size.width / 3),
              child: CircularProfileAvatar(
                "",
                radius: 60,
                child: Image.asset(
                  "assets/user.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 30, left: 25, right: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.black26,
                ),
              ]),
          height: 400,
          child: Column(
            children: <Widget>[
              myAccWidget(Icons.perm_identity, "Test user Name"),
              Divider(),
              myAccWidget(Icons.phone, "+91 9515792944"),
              Divider(),
              myAccWidget(Icons.alternate_email, "--"),
              Divider(),
              myAccWidget(Icons.location_city, "Nandyal"),
              Divider(),
              myAccWidget(Icons.pin_drop, "518501")
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          height: 60,
          margin: EdgeInsets.only(
            top: 15,
            bottom: 15,
              left: MediaQuery.of(context).size.width / 4,
              right: MediaQuery.of(context).size.width / 4),
          child: RaisedButton(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            onPressed: () => print("object"),
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 28,
                ),
                Text(
                  "   Logout",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

myAccWidget(icon, txt) {
  return Container(
    margin: EdgeInsets.only(left: 20, top: 15, bottom: 6),
    child: Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blue,
        ),
        Text(
          "   " + txt,
          style: TextStyle(fontSize: 22, color: Colors.blue),
        )
      ],
    ),
  );
}
