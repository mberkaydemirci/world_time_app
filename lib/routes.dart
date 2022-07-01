import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:world_time/view/landing/landingpage.dart';
import 'package:world_time/view/splash/splashpage.dart';
import 'package:world_time/view/worldtime/worldtimedetailpage.dart';
import 'package:world_time/view/worldtime/worldtimepage.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case worldTimePage:
        print('SA');
        return MaterialPageRoute(
            builder: (_) => WorldTimePage(
            ));
      case worldTimeDetailPage:
        return MaterialPageRoute(
            builder: (_) => WorldTimeDetailPage());
      case landingPage:
        return MaterialPageRoute(
            builder: (_) => LandingPage(
            ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('Ters giden birşeyler oldu'),
            ),
          ),
        );
    }
  }
}
// iki de basketpagegift tanımlanmıştı
const String splashPage = '/splashpage';
const String worldTimePage = '/worldtimepage';
const String worldTimeDetailPage = '/worldtimedetailpage';
const String landingPage = '/landingPage';

