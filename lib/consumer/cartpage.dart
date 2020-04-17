import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CartPage extends StatefulWidget {
  DocumentSnapshot data;
  CartPage(this.data);
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    print(widget.data.documentID);
    super.initState();
  }

  _launchCaller() async {
    var url = "tel:" + widget.data.documentID.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.phone, color: Colors.white),
              onPressed: _launchCaller)
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Text("dataa")),
          Container(height: 100, child: Row(
            children: <Widget>[
              
              RaisedButton(onPressed: null),
            ],
          ))
        ],
      ),
    );
  }
}
