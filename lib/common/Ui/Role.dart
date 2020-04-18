import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grona/common/Ui/CustomerDetails.dart';
import 'package:grona/common/Ui/size.dart';
import 'package:grona/common/services/Navigation.dart';
import 'package:grona/common/services/dialog.dart';
import 'package:grona/locator.dart';

class Role extends StatefulWidget {
  @override
  _RoleState createState() => _RoleState();
}

class _RoleState extends State<Role> {
  bool customer = false;
  bool selected = false;
  bool merchant = false;
  String role;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: SizeConfig.blockSizeVertical*15,),
             Center(child: Text('Select the Profile',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),)),
              SizedBox(height: SizeConfig.blockSizeVertical*15,),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                      InkWell(
                        onTap: (){
                          setState(() {
                            selected = true;
                            customer = false;
                            merchant = true;
                            role = 'Merchant';
                          });
                        },
                       child: Container(
                         padding: EdgeInsets.only(top: 10,right: 5),
                         height: SizeConfig.blockSizeVertical*25,
                         color: merchant?Colors.blue:null,
                         child: Column(
                           children: <Widget>[
                             SvgPicture.asset('assets/entrepreneur.svg',height: SizeConfig.blockSizeVertical*18),
                             SizedBox(height:SizeConfig.blockSizeVertical*3),
                             Text('Shop keeper',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color:merchant?Colors.white:null,),)
                           ],
                         ),
                       ),
                     ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          selected = true;
                          customer = true;
                          merchant = false;
                          role = 'Customer';
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 10,left: 10,right: 5),
                        height: SizeConfig.blockSizeVertical*25,
                        color: customer?Colors.blue:null,
                        child: Column(
                          children: <Widget>[
                            Hero(tag: 'Customer',child: SvgPicture.asset('assets/undraw_online_groceries_a02y.svg',height: SizeConfig.blockSizeVertical*18)),
                            SizedBox(height:SizeConfig.blockSizeVertical*3),
                            Text('Customer',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color: customer?Colors.white:null,),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical*29,),
               selected?MaterialButton(
                onPressed: (){
                  if(role == 'Customer'){
                   Navigator.push(context,CupertinoPageRoute(builder: (context)=>CustomerDetails()));
                  }
                  else{

                  }
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                child: Text('Confirm')
              ):Container()
            ],
          ),
        ),
      ),
    );
  }
}
