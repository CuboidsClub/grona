import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grona/common/Ui/size.dart';
import 'package:grona/common/services/DataBase.dart';
import 'package:provider_architecture/viewmodel_provider.dart';

import 'BusyButton.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: SizeConfig.blockSizeVertical*12,),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text('Choose Account Type',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25,top: 5),
                child: Text('Select the account type suitable for you',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical*7,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      height: 240,
                      width: 300,
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            selected = true;
                            customer = false;
                            merchant = true;
                            role = 'Merchant';
                          });
                        },
                        child: Card(
                          elevation: 10,
                          child: Container(
                            color: merchant?Colors.blue:null,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset('assets/undraw_business_shop_qw5t.svg',height: SizeConfig.blockSizeVertical*14),
                                SizedBox(height:SizeConfig.blockSizeVertical*3),
                                Text('Shop keeper',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color:merchant?Colors.white:null,),),
                                Padding(
                                  padding:EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                                  child: Text('(You can sell your product to the customer at ease just with one click)',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,color:merchant?Colors.white:null,),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selected = true;
                        customer = true;
                        merchant = false;
                        role = 'Customer';
                      });
                    },
                    child: SizedBox(
                      height: 240,
                      width: 300,
                      child: Card(
                        elevation: 10,
                        child: Container(
                          color: customer?Colors.blue:null,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height:SizeConfig.blockSizeVertical*1),
                              Hero(tag: 'Customer',child: SvgPicture.asset('assets/undraw_online_groceries_a02y.svg',height: SizeConfig.blockSizeVertical*14)),
                              SizedBox(height:SizeConfig.blockSizeVertical*3),
                              Text('Customer',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color: customer?Colors.white:null,),),
                              Padding(
                                padding:EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                                child: Text('(You can Buy product from the Grocery Store at ease just with one click)',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,color:customer?Colors.white:null,),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.blockSizeVertical*8,),
              Center(
                child: MaterialButton(
                    onPressed: (){
                      if(role == 'Customer'){
                        Navigator.push(context,CupertinoPageRoute(builder: (context)=>CustomerDetails()));
                      }
                      else{

                      }
                    },
                    color: selected?Colors.blue:Colors.red,
                    textColor: Colors.white,
                    child: Text('Confirm')
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class CustomerDetails extends StatefulWidget {
  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  final _key = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: DataBase(),
      builder:(context,model,child)=>Material(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              child: Form(
                key: _key,
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
                      child: TextFormField(
                        controller: name,
                        validator: (value)=>value.isEmpty?'Name cannot be Empty?':null,
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
                      child: TextFormField(
                        controller: email,
                        validator: (value)=>value.isEmpty?'Email cannot be Empty?':null,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email:',
                            hintText: 'Enter your Email'
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical*25),
                    Padding(
                      padding: EdgeInsets.only(left: 60,right: 60),
                      child: BusyButton(
                        title: 'Confirm',
                        busy: model.busy,
                        onPressed: ()async{
                          if(_key.currentState.validate()){
                            model.createCustomerRecord(email: email.text,name: name.text);
                          }
                        },
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical*3,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
