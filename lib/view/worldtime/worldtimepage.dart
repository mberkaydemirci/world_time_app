import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:world_time/core/viewmodels/worldtimeviewmodel.dart';
import 'package:world_time/routes.dart';
import 'package:world_time/view/splash/splashpage.dart';

import '../../core/viewmodels/themeprovider.dart';

class WorldTimePage extends StatefulWidget {
  const WorldTimePage({Key? key}) : super(key: key);

  @override
  _WorldTimePageState createState() => _WorldTimePageState();
}

class _WorldTimePageState extends State<WorldTimePage> {
  String _timeString = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init state working');
    context.read<WorldTimeViewModel>().getCapitalName();
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    Timer.periodic(Duration(seconds: 1), (Timer t) => dateTime = DateTime.now());
    print('HERE ${context.watch<WorldTimeViewModel>().capitalNames}');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.0),
        child: AppBar(
          elevation: 0,
            automaticallyImplyLeading: false,
          backgroundColor: context.watch<ThemeProvider>().isDarkMode ? Color(0xFF02327D) : Color(0xFFE3EEFF),
        ),
      ),
      backgroundColor: context.watch<ThemeProvider>().isDarkMode ? Color(0xFF002359) : Colors.white,
      body:
      SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: context.watch<ThemeProvider>().isDarkMode ? Color(0xFF02327D) : Color(0xFFE3EEFF),
                    borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(32.0),
                      bottomRight: const Radius.circular(32.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only( left: MediaQuery.of(context).size.width*0.13, right: MediaQuery.of(context).size.width*0.13),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Günaydın, Özgür!',
                              style: TextStyle(color: context.read<ThemeProvider>().isDarkMode? Colors.white: Color(0xFF002359),fontSize: 15,fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.34),
                              child: InkWell(
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.08,
                                    height: MediaQuery.of(context).size.height*0.03,
                                    decoration: context.read<ThemeProvider>().isDarkMode?BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50)
                                    ):BoxDecoration(
                                        color: Color(0xFF002359),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: context.read<ThemeProvider>().isDarkMode?Image.asset('assets/image/sun.png',color: Colors.black,):Image.asset('assets/image/vector.png',color: Colors.white,)),
                                onTap: (){
                                  context.read<ThemeProvider>().toggleTheme();
                                  // provider.toggleTheme(context.watch<ThemeProvider>().isDarkMode);
                                },
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 10,),
                        Text(
                          '${_timeString.split(' ')[1].split(':')[0]}:${_timeString.split(' ')[1].split(':')[1]}',
                          style: TextStyle(color: context.read<ThemeProvider>().isDarkMode? Colors.white: Color(0xFF002359),fontSize: 32,
                          fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          '${dateTime.day} ${WorldTimeViewModel.monthOfYear[dateTime.month-1]},${WorldTimeViewModel.dayOfWeek[(dateTime.day%7)+1]}',
                          style: TextStyle(color: context.read<ThemeProvider>().isDarkMode? Colors.white: Color(0xFF002359),fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  height: MediaQuery.of(context).size.height*0.2,
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.17, left: MediaQuery.of(context).size.width*0.13, right: MediaQuery.of(context).size.width*0.13),
                  child: Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Arama'
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(
                        color: Color(0xFF8FAFE0),
                        width: 1,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height*0.05,
                    width: MediaQuery.of(context).size.width*0.74,
                  ),
                )
              ],
            )
            ,
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount:
                      context.watch<WorldTimeViewModel>().capitalNames.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height*0.05,
                                width: MediaQuery.of(context).size.width*0.74,
                                decoration: BoxDecoration(
                                  color: context.read<ThemeProvider>().isDarkMode
                                      ? Color(0xFF02327D)
                                      : Color(0xFFE3EEFF),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.012, left: MediaQuery.of(context).size.width*0.04),
                                  child: Text(
                                    '${context.watch<WorldTimeViewModel>().capitalNames[index]}',style: TextStyle(
                                    color: context.read<ThemeProvider>().isDarkMode? Colors.white: Color(0xFF002359),
                                  ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only( left: MediaQuery.of(context).size.width*0.7,top: MediaQuery.of(context).size.height*0.005),
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.1,
                                  height: MediaQuery.of(context).size.height*0.04,
                                  decoration: context.read<ThemeProvider>().isDarkMode?BoxDecoration(
                                      color: Color(0xFF02327D),
                                      borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: Color(0xFF002359),
                                      width: 4,
                                    )
                                  ):BoxDecoration(
                                      color: Color(0xFFE3EEFF),
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 4,
                                      )
                                  ),
                                  child: context.read<ThemeProvider>().isDarkMode?Image.asset('assets/image/arrow.png',color: Colors.white):Image.asset('assets/image/arrow.png',color: Color(0xFF002359)),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      onTap: () {
                        context.read<WorldTimeViewModel>().getTime(context
                            .read<WorldTimeViewModel>()
                            .capitalNames[index]);
                        Timer(Duration(seconds: 1), () {
                          setState(() {
                            Navigator.pushNamed(context, worldTimeDetailPage);
                          });
                        });
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }
}
