import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time/core/viewmodels/themeprovider.dart';
import 'package:world_time/core/viewmodels/worldtimeviewmodel.dart';

class WorldTimeDetailPage extends StatefulWidget {
  const WorldTimeDetailPage({Key? key}) : super(key: key);

  @override
  _WorldTimeDetailPageState createState() => _WorldTimeDetailPageState();
}

class _WorldTimeDetailPageState extends State<WorldTimeDetailPage> {
  @override
  late Timer timer;

  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) {
      Provider.of<WorldTimeViewModel>(context, listen: false)
          .getTime(context.read<WorldTimeViewModel>().selectedName);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.read<ThemeProvider>().isDarkMode
          ? Color(0xFF002359)
          : Colors.white,
      appBar: AppBar(
        backgroundColor: context.watch<ThemeProvider>().isDarkMode
            ? Color(0xFF02327D)
            : Color(0xFFE3EEFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32),
          ),
        ),
        title: context.watch<ThemeProvider>().isDarkMode
            ? Image.asset('assets/image/worldtime1.png', fit: BoxFit.cover)
            : Image.asset('assets/image/worldtime1.png',
                color: Color(0xFF02327D), fit: BoxFit.cover),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                    left: MediaQuery.of(context).size.width * 0.08),
                child: Container(
                  child: Center(
                      child: Text(
                    '${context.watch<WorldTimeViewModel>().time.split(":")[0]}',
                    style: TextStyle(fontSize: 79,color: context.read<ThemeProvider>().isDarkMode
                        ? Colors.white
                        : Color(0xFF02327D)),
                  )),
                  decoration: BoxDecoration(
                      // color: Color(0xFF02327D),
                      color: context.read<ThemeProvider>().isDarkMode
                          ? Color(0xFF02327D)
                          : Colors.white,
                      borderRadius: new BorderRadius.all(
                        const Radius.circular(14.0),
                      ),
                      border: Border.all(width: 2)),
                  height: 140,
                  width: 140,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Text(
                  ':',
                  style: TextStyle(fontSize: 79),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Container(
                  child: Center(
                      child: Text(
                    '${context.watch<WorldTimeViewModel>().time.split(":")[1]}',
                    style: TextStyle(fontSize: 79,color: context.read<ThemeProvider>().isDarkMode
                        ? Colors.white
                        : Color(0xFF02327D),),
                  )),
                  decoration: BoxDecoration(
                      // color: Color(0xFF02327D),
                      color: context.read<ThemeProvider>().isDarkMode
                          ? Color(0xFF02327D)
                          : Colors.white,
                      borderRadius: new BorderRadius.all(
                        const Radius.circular(14.0),
                      ),
                      border: Border.all(width: 2)),
                  height: 140,
                  width: 140,
                ),
              ),
            ],
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: Text(
              '${context.watch<WorldTimeViewModel>().selectedName.split('/')[1]}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color: context.read<ThemeProvider>().isDarkMode
                  ? Colors.white
                  : Color(0xFF002359),),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            child: Text(
              '${context.watch<WorldTimeViewModel>().selectedName.split('/')[0]}',
              style: TextStyle(fontSize: 24,color: context.read<ThemeProvider>().isDarkMode
                  ? Colors.white
                  : Color(0xFF002359)),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: Text(
              '${WorldTimeViewModel.dayOfWeek[(context.watch<WorldTimeViewModel>().capitalTime.dayOfWeek)! - 1]}, ${context.watch<WorldTimeViewModel>().capitalTime.abbreviation} ${context.watch<WorldTimeViewModel>().capitalTime.utcOffset}',
              style: TextStyle(fontSize: 24,color: context.read<ThemeProvider>().isDarkMode
                  ? Colors.white
                  : Color(0xFF002359)),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: Text(
              '${WorldTimeViewModel.monthOfYear[(int.parse(context.watch<WorldTimeViewModel>().date.split('-')[1])) - 1]} ${context.watch<WorldTimeViewModel>().date.split('-')[2]},${context.watch<WorldTimeViewModel>().date.split('-')[0]}',
              style: TextStyle(fontSize: 24,color: context.read<ThemeProvider>().isDarkMode
                  ? Colors.white
                  : Color(0xFF002359)),
            ),
          ),
        ],
      ),
    );
  }
}
