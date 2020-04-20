import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grona/common/Ui/BusyButton.dart';
import 'package:grona/common/Ui/size.dart';
import 'package:grona/common/ViewModel/LoginPageViewModel.dart';
import 'package:grona/common/services/Navigation.dart';
import 'package:grona/common/services/dialog.dart';
import 'package:grona/locator.dart';
import 'package:provider_architecture/provider_architecture.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
          child: Scaffold(
            body: SafeArea(
                child:Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                     SizedBox(height: SizeConfig.blockSizeVertical*10),
                     Center(child: Text('Welcome to Grona',style: TextStyle(fontSize: SizeConfig.blockSizeVertical*3),)),
                     SizedBox(height: SizeConfig.blockSizeVertical*16),
                     SvgPicture.asset('assets/undraw_shopping_app_flsj.svg',
                       height: SizeConfig.blockSizeVertical*27
                     ),
                      SizedBox(height: SizeConfig.blockSizeVertical*12),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: Theme.of(context).textTheme.subtitle,
                          children: [
                            TextSpan(text: 'Read our'),
                            TextSpan(text: ' Privacy Policy.',style: TextStyle(color: Colors.blue),recognizer: TapGestureRecognizer()..onTap=(){
                            },),
                            TextSpan(text: 'Tap"Agree and continue" to accept\n'),
                            TextSpan(text: 'the '),
                            TextSpan(text: 'Teams of Service.',style: TextStyle(color: Colors.blue),recognizer: TapGestureRecognizer()..onTap=(){},),
                          ]
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical*3,),
                      MaterialButton(
                        height: SizeConfig.blockSizeVertical*5,
                        minWidth: SizeConfig.blockSizeHorizontal*10,
                        color: Colors.blue,
                        onPressed: (){
                          Navigator.pushReplacement(
                              context, CupertinoPageRoute(builder: (context) => EnterDetails()));
                        },
                        child: Text('AGREE AND CONTINUE',style: TextStyle(color: Colors.white),),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical*4),
                      Text('from'),
                      SizedBox(height: SizeConfig.blockSizeVertical*2),
                      RichText(
                        textAlign: TextAlign.center,
                          text:TextSpan(
                              style: Theme.of(context).textTheme.subtitle,
                        children: [
                          TextSpan(
                            text: 'CUBOIDS CLUB\n',style: TextStyle(letterSpacing: 2,fontSize: 17,fontWeight: FontWeight.w900),
                          ),
                          TextSpan(
                            text: '(BIHER)',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                          )
                        ]
                      ))
                   ],
                  ),
             )
            ),
          ),
        );
  }
}

class EnterDetails extends StatefulWidget {
  @override
  _EnterDetailsState createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
  bool busy = false;
  String country = 'India';
  String number;
  final key = GlobalKey<FormState>();
  TextEditingController countryId = TextEditingController(text: '+91');
  TextEditingController phoneNum = TextEditingController();
  ShowDialog _showDialog = locator<ShowDialog>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ViewModelProvider.withConsumer(
        viewModel: LoginPageViewModel(),
        builder: (context,model,child)=>Material(
          child: Scaffold(
            body: SafeArea(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Form(
                        key: key,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: SizeConfig.blockSizeVertical*3),
                            Text('Enter your phone number',style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.1),),
                            SizedBox(height: SizeConfig.blockSizeVertical*3.5),
                            RichText(
                              textAlign: TextAlign.center,
                                text: TextSpan(
                                    style: Theme.of(context).textTheme.subtitle,
                              children: <TextSpan>[
                                TextSpan(
                                    text:'Grona will send an SMS message to verify your phone number.',
                                ),
                                TextSpan(
                                  text: ' Enter your number.',style: TextStyle(color: Colors.blue)
                                )
                              ]
                            )),
                            SizedBox(height: SizeConfig.blockSizeVertical*1,),
                            Padding(
                              padding: EdgeInsets.only(left: 80,right: 80,),
                              child: DropdownButton(
                                value: country,
                                isExpanded: true,
                                onChanged: (value){
                                  setState(() {
                                    country = value;
                                  });
                                },
                                items: [
                                  DropdownMenuItem(
                                    value: 'India',
                                    child: Center(child: Text('India')),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 80,left: 80,),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(
                                      flex: 6,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: TextFormField(
                                          validator: (value)=>value.isEmpty?'Phone number cannot be empty':null,
                                          textAlign: TextAlign.center,
                                          controller: countryId,
                                          decoration: InputDecoration(
                                          ),
                                        ),
                                      )
                                  ),
                                  SizedBox(width: SizeConfig.blockSizeVertical*1),
                                  Flexible(
                                      flex: 14,
                                      child: TextFormField(
                                        maxLength: 10,
                                        controller: phoneNum,
                                        validator: (value)=>value.isEmpty?'Enter the phone number':null,
                                        decoration: InputDecoration(
                                            hintText: 'phone number'
                                        ),
                                        keyboardType: TextInputType.phone,
                                      )
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical*1.3),
                            Text('Carrier SMS charges may apply')
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 40,left: 90,right: 90),
                      child: BusyButton(
                        title: 'Confirm',
                        busy: model.busy,
                        onPressed: ()async{
                            if(key.currentState.validate()){
                              number=countryId.text+phoneNum.text;
                              var response =  await _showDialog.showDialog(title: 'Grona',description: 'Check your phone number is correct before clicking Confirm $number',buttonTitle: 'Confirm');
                              if(response.confirmed){
                                await model.createUserWithPhone(number=countryId.text+phoneNum.text);
                              }
                            }
                        },
                      ),
                    )
                  ],
                )
            ),
          ),
        )
    );
  }
}

// ignore: must_be_immutable
class Otp extends StatelessWidget {
  Map information;
  Otp({this.information});
  Navigation _navigation = locator<Navigation>();
  TextEditingController otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String phoneNo = information['phone'];
    String verID = information['verid'];
    return ViewModelProvider.withConsumer(
      viewModel: LoginPageViewModel(),
      builder:(context,model,child)=>Material(
        child: Scaffold(
          body: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height:SizeConfig.blockSizeVertical*3),
                  Center(child: Text('Verify $phoneNo',style: TextStyle(fontSize: 18),)),
                  SizedBox(height:SizeConfig.blockSizeVertical*1),
                  Text('Waiting to automatically detect an Sms sent to\n$phoneNo.',style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
                  SizedBox(height:SizeConfig.blockSizeVertical*5),
                  Padding(
                    padding: EdgeInsets.only(left: 50,right: 50),
                    child: TextField(
                      maxLength: 6,
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                      controller: otp,
                      decoration: InputDecoration(
                          hintText: 'Enter the OTP'
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical*2),
                 Padding(
                   padding: EdgeInsets.only(left: 130,right: 130),
                   child: BusyButton(
                     title: 'Confirm',
                     busy: model.busy,
                     onPressed: ()async{
                       await model.signInWithOTP(otp.text, verID);
                     },
                   ),
                 ),
                  SizedBox(height: SizeConfig.blockSizeVertical*2),
                  RaisedButton(
                    onPressed: (){
                      _navigation.pop();
                    },
                    textColor: Colors.white,
                    child: Text('Wrong Number?'),
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


