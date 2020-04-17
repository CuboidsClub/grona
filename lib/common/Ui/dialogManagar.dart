import 'package:flutter/material.dart';
import 'package:grona/AlertRequest.dart';
import 'package:grona/AlertResponse.dart';
import 'package:grona/common/services/dialog.dart';
import 'package:grona/locator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ShowDialogManager extends StatefulWidget {
  final Widget child;
  ShowDialogManager({this.child});
  _ShowDialogManagerState createState() => _ShowDialogManagerState();
}

class _ShowDialogManagerState extends State<ShowDialogManager> {

  ShowDialog showDialog = locator<ShowDialog>();

  @override
  void initState() {
    super.initState();
    showDialog.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(AlertRequest request){
    Alert(context: context,
        title: request.title,
        desc: request.description,
        buttons: [
          DialogButton(
            child: Text(request.buttonTitle),
            onPressed: (){
              Navigator.pop(context);
              showDialog.showDialogCompleter(AlertResponse(confirmed: true));
            },
          )
        ],
        closeFunction: ()=>showDialog.showDialogCompleter(AlertResponse(confirmed: false)),
    ).show();
  }

}
