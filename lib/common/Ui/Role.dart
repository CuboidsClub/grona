import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grona/common/Ui/size.dart';
import 'package:grona/common/services/DataBase.dart';
import 'package:grona/common/services/Navigation.dart';
import 'package:grona/constant.dart';
import 'package:grona/locator.dart';
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
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*8,right: SizeConfig.blockSizeHorizontal*8),
                child: Center(
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                      color: merchant?Colors.blue:null,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Hero(tag: 'merchant',child: SvgPicture.asset('assets/undraw_business_shop_qw5t.svg',height: SizeConfig.blockSizeVertical*14)),
                            SizedBox(height:SizeConfig.blockSizeVertical*3),
                            Text('Merchant',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color:merchant?Colors.white:null,),),
                            Padding(
                              padding:EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                              child: Text('(You can sell your product to the customer at ease just with one click)',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w300,color:merchant?Colors.white:null,),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height:SizeConfig.blockSizeVertical*4),
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*8,right: SizeConfig.blockSizeHorizontal*8),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      selected = true;
                      customer = true;
                      merchant = false;
                      role = 'Customer';
                    });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                    elevation: 10,
                    color: customer?Colors.blue:null,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height:SizeConfig.blockSizeVertical*1),
                          Hero(tag: 'Customer',child: SvgPicture.asset('assets/undraw_online_groceries_a02y.svg',height: SizeConfig.blockSizeVertical*14)),
                          SizedBox(height:SizeConfig.blockSizeVertical*3),
                          Text('Customer',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: customer?Colors.white:null,),),
                          Padding(
                            padding:EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                            child: Text('(You can Buy product from the Grocery Store at ease just with one click)',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w300,color:customer?Colors.white:null,),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical*6),
              Center(
                child: MaterialButton(
                    onPressed: (){
                      if(role == 'Customer'){
                        Navigator.push(context,CupertinoPageRoute(builder: (context)=>CustomerDetails()));
                      }
                      else{
                        Navigator.push(context,CupertinoPageRoute(builder: (context)=>Merchant()));
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
                    Text('Customer',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 30,letterSpacing: 2,),),
                    SizedBox(height: SizeConfig.blockSizeVertical*5,),
                    Text('Hey,Customer please fill the following\nbefore getting Started',style: TextStyle(fontSize: 21,fontWeight: FontWeight.w400),),
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

class Merchant extends StatefulWidget {
  @override
  _MerchantState createState() => _MerchantState();
}

class _MerchantState extends State<Merchant> {
  bool grocery;
  bool pharmacy;
  final _key = GlobalKey<FormState>();
  String name,shopName,address,district,pinCode;
  String shopType;
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: DataBase(),
      builder:(context,model,child)=>Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*10,right: SizeConfig.blockSizeHorizontal*10,),
              child: Form(
                key: _key,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: SizeConfig.blockSizeHorizontal*20),
                    Center(child: Hero(tag: 'merchant',child: SvgPicture.asset('assets/undraw_business_shop_qw5t.svg',height: SizeConfig.blockSizeVertical*18))),
                    SizedBox(height:SizeConfig.blockSizeVertical*3),
                    Text('Merchant',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 30,letterSpacing: 2),),
                    SizedBox(height:SizeConfig.blockSizeVertical*2),
                    TextFormField(
                      validator: (value)=>value.isEmpty?'Name cannot be empty':null,
                     onSaved: (value)=>name=value,
                     decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.account_circle),
                      labelText: 'Name:',
                      hintText: 'Enter the your name'
                    ),
                    ),
                    SizedBox(height:SizeConfig.blockSizeVertical*2),
                    TextFormField(
                      validator: (value)=>value.isEmpty?'Shop name cannot be empty':null,
                      onSaved: (value)=>shopName=value,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.shopping_cart),
                          labelText: 'Shop Name:',
                          hintText: 'Enter the your Shop name'
                      ),
                    ),
                    SizedBox(height:SizeConfig.blockSizeVertical*2),
                    DropdownButtonFormField(
                      validator: (value)=>value==null?'Select the Shop type':null,
                      value: shopType,
                      onChanged: (value){
                        setState(() {
                          shopType = value;
                        });
                      },
                      isDense: true,
                      items: [
                        DropdownMenuItem(child:Text('Pharmacy'),value: 'Pharmacy',),
                        DropdownMenuItem(child:Text('Grocery'),value: 'Grocery',)
                      ],
                     decoration: InputDecoration(
                       prefixIcon: Icon(Icons.verified_user),
                       labelText: 'Select the shop type',
                       border: OutlineInputBorder(),
                     ),
                    ),
                    SizedBox(height:SizeConfig.blockSizeVertical*2),
                    TextFormField(
                      onSaved: (value)=>address=value,
                      validator: (value)=>value.isEmpty?'Address cannot be empty':null,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.location_city),
                          labelText: 'Address',
                          hintText: 'Enter the address of your Shop'
                      ),
                    ),
                    SizedBox(height:SizeConfig.blockSizeVertical*2),
                    TextFormField(
                      validator: (value)=>value.isEmpty?'district cannot be empty':null,
                      onSaved: (value)=>district=value,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.location_city),
                          labelText: 'District',
                          hintText: 'Enter the District of your address'
                      ),
                    ),
                    SizedBox(height:SizeConfig.blockSizeVertical*2),
                    TextFormField(
                      onSaved: (value)=>pinCode=value,
                      maxLength: 6,
                      validator: (value)=>value.isEmpty?'pincode cannot be empty':null,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.pin_drop),
                          labelText: 'Pincode',
                          hintText: 'Enter the picode of your address'
                      ),
                    ),
                    SizedBox(height:SizeConfig.blockSizeVertical*2),
                    BusyButton(
                      title: 'Confirm',
                      busy: model.busy,
                      onPressed: ()async{
                        if(_key.currentState.validate()){
                          _key.currentState.save();
                          if(shopType=='Grocery'){
                            grocery = true;
                            pharmacy = false;
                          }else{
                            grocery = false;
                            pharmacy = true;
                          }
                          await model.createMerchantRecord(name:name,pinCode:pinCode,address:address,district:district,shopName:shopName,grocery:grocery,pharmacy:pharmacy);
                        }
                      },
                    ),
                    SizedBox(height:SizeConfig.blockSizeVertical*2),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}

class RoleSelection extends StatelessWidget{
  Navigation _navigation = locator<Navigation>();
  @override
  Widget build(BuildContext context) {
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
                child: Text('You have two accounts on your phone number',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical*7,),
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*8,right: SizeConfig.blockSizeHorizontal*8),
                child: Center(
                  child: InkWell(
                    onTap: (){
                      _navigation.replaceAllNavigateTo(HomeViewRoute);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Hero(tag: 'merchant',child: SvgPicture.asset('assets/undraw_business_shop_qw5t.svg',height: SizeConfig.blockSizeVertical*14)),
                            SizedBox(height:SizeConfig.blockSizeVertical*3),
                            Text('Merchant',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                            Padding(
                              padding:EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                              child: Text('(You can sell your product to the customer at ease just with one click)',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w300),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height:SizeConfig.blockSizeVertical*4),
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*8,right: SizeConfig.blockSizeHorizontal*8),
                child: InkWell(
                  onTap: (){
                    _navigation.replaceAllNavigateTo(CustomerHomeRoute);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height:SizeConfig.blockSizeVertical*1),
                          Hero(tag: 'Customer',child: SvgPicture.asset('assets/undraw_online_groceries_a02y.svg',height: SizeConfig.blockSizeVertical*14)),
                          SizedBox(height:SizeConfig.blockSizeVertical*3),
                          Text('Customer',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                          Padding(
                            padding:EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                            child: Text('(You can Buy product from the Grocery Store at ease just with one click)',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w300),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



