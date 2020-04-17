import 'dart:async';
import 'package:grona/AlertRequest.dart';
import 'package:grona/AlertResponse.dart';

class ShowDialog{
  Function(AlertRequest) _showDialogListener;
  Completer<AlertResponse> _showDialogCompleter;

  void registerDialogListener(Function(AlertRequest) showDialogListener){
    _showDialogListener = showDialogListener;
  }

  Future<AlertResponse> showDialog({String title,String description, String buttonTitle = 'Ok'})
  {
    _showDialogCompleter = Completer();
    _showDialogListener(AlertRequest(title: title,description: description,buttonTitle: buttonTitle));
    return _showDialogCompleter.future;
  }

  void showDialogCompleter(AlertResponse response){
    _showDialogCompleter.complete(response);
    _showDialogCompleter = null;
  }
}