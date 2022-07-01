import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:world_time/core/locator/get_it.dart';
import 'package:world_time/core/viewmodels/themeprovider.dart';
import 'package:world_time/core/viewmodels/worldtimeviewmodel.dart';
import 'package:world_time/routes.dart';
import 'package:world_time/view/worldtime/worldtimepage.dart';

void main() {
  setuplocater();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<WorldTimeViewModel>(
          create: (context) => WorldTimeViewModel()),
      ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider()),
    ],
    child: MyApp(),
  ));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: context.watch<ThemeProvider>().isDarkMode ? Color(0xFF02327D) : Color(0xFFE3EEFF),
    ));
    return ScreenUtilInit(
      designSize: Size(360, 690),
        builder: (BuildContext context, Widget? child) {
      // builder: (context, _) {
          return MaterialApp(
            title: 'Arabica Coffee House',
            debugShowCheckedModeBanner: false,
            // themeMode: context.read<ThemeProvider>().themeMode,
            // localizationsDelegates: context.localizationDelegates,
            // supportedLocales: context.supportedLocales,
            builder: DevicePreview.appBuilder,
            locale: DevicePreview.locale(context),
            initialRoute: landingPage,
            onGenerateRoute: Routes.generateRoute,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
          );
        },
    );
  }
}




