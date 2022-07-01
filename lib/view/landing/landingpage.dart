import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time/core/viewmodels/worldtimeviewmodel.dart';
import 'package:world_time/view/worldtime/worldtimepage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final _worldTimeViewModel = Provider.of<WorldTimeViewModel>(context);
    if(!_worldTimeViewModel.isLoading)
      {
        return WorldTimePage();
      }else{
      return Scaffold(
          body: Center(child: Image.asset('assets/image/doplogo.png')));
    }
  }
}
