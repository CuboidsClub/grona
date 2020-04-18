import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grona/common/Ui/size.dart';
import 'package:grona/common/services/DataBase.dart';
import 'package:grona/common/services/Navigation.dart';
import 'package:grona/constant.dart';
import 'package:grona/locator.dart';

class CustomerDetails extends StatefulWidget {
  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  Navigation _navigation = locator<Navigation>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.blockSizeHorizontal*20),
                Hero(
                  tag: 'Customer',
                  child: Center(child: SvgPicture.asset('assets/undraw_online_groceries_a02y.svg',height: SizeConfig.blockSizeVertical*18))),
                SizedBox(height:SizeConfig.blockSizeVertical*3),
                Text('Customer',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
                SizedBox(height: SizeConfig.blockSizeVertical*5,),
                Text('Hey,Customer please fill the following\nbefore getting Started',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                SizedBox(height: SizeConfig.blockSizeVertical*4),
                Padding(
                  padding: EdgeInsets.only(left: 40,right: 40),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name:',
                      hintText: 'Enter your name'
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical*3,),
                Padding(
                  padding: EdgeInsets.only(left: 40,right: 40),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email:',
                        hintText: 'Enter your Email'
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical*25),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: ()async{
                    await DataBase().createCustomerRecord(email: email.text,name: name.text);
                    _navigation.replaceNavigateTo(HomeViewRoute);
                    },
                  textColor: Colors.white,
                  child: Text('Confirm'),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical*3,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
