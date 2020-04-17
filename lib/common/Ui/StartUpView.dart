import 'package:flutter/material.dart';
import 'package:grona/common/ViewModel/StartUpViewModel.dart';
import 'package:provider_architecture/provider_architecture.dart';


class StartUpView extends StatelessWidget {
  const StartUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StartUpViewModel>.withConsumer(
      viewModel: StartUpViewModel(),
      onModelReady: (model) => model.handleLogic(),
      builder: (context, model, child) => Material(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(child: Text('GRONA',style: TextStyle(fontSize: 30,letterSpacing: 2),))
            ],
          ),
        ),
      ),
    );
  }
}
