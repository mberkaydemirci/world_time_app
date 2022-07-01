import 'package:flutter/material.dart';
import 'package:world_time/core/models/capitaltime.dart';
import 'package:world_time/core/services/worldtimeservice.dart';

import '../locator/get_it.dart';

class WorldTimeViewModel extends ChangeNotifier{
  bool _isLoading = false;
  String _date ='';
  String _time = '';
  static const List<String> dayOfWeek = ['Pazartesi','Salı','Çarşamba','Perşembe','Cuma','Cumartesi','Pazar'];
  static const List<String> monthOfYear = ['Ocak','Şubat','Mart','Nisan','Mayıs','Haziran','Temmuz','Ağustos','Eylül','Ekim','Kasım','Aralık'];
  String get date => _date;
  WorldTimeService worldTimeService = locator<WorldTimeService>();
  List<String> _capitalNames = [];
  String _selectedName = '';

  String get selectedName => _selectedName;

  set selectedName(String value) {
    _selectedName = value;
  }

  late CapitalTime _capitalTime;

  CapitalTime get capitalTime => _capitalTime;
  TextEditingController searchController = TextEditingController();

  List<String> get capitalNames => _capitalNames;

  set capitalNames(List<String> value) {
    _capitalNames = value;
    notifyListeners();
  }
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  getCapitalName()async{
    _isLoading = true;
    _capitalNames = await worldTimeService.getCapital();
    _isLoading = false;
    notifyListeners();
  }

  getTime(String name)async{
    _selectedName = name;
    _capitalTime = await worldTimeService.getTime(name);
    _date = _capitalTime.datetime!.split("T")[0];
    _time = _capitalTime.datetime!.split("T")[1];
    print('DATE SPLITED ${_time.split(":")}');
    print('TIME SPLITED ${time}');
    notifyListeners();
  }

  String get time => _time;
}
