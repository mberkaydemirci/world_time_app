import 'package:dio/dio.dart';
import 'package:world_time/core/constant/api.dart';
import 'package:world_time/core/models/capitalnamemodel.dart';
import 'package:world_time/core/models/capitaltime.dart';
class WorldTimeService{
  getCapital() async {
    Dio dio = Dio();
    Response response =
        await dio.get(ApiCostant.apiUrl + "timezone/Africa");
    print(response.data);
    print("CONTENT CHECK ${response.data}");
    // CapitalName capitalName = CapitalName.fromJson(response.data);
    List<dynamic> capitalName = response.data;
    print('getCapital Run ${capitalName}');
    return capitalName.map((e) => e.toString()).toList();
  }

  getTime(String name)async{
    Dio dio = Dio();
    Response response =
        await dio.get(ApiCostant.apiUrl + "timezone/" + name);
    print(response.data);
    print("CONTENT CHECK ${response.data}");
    // CapitalName capitalName = CapitalName.fromJson(response.data);
    CapitalTime capitalTime = CapitalTime.fromJson(response.data);
    print('getTime Run ${capitalTime}');
    return capitalTime;
  }
}