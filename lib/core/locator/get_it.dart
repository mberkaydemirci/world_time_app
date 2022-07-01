import 'package:get_it/get_it.dart';
import 'package:world_time/core/services/worldtimeservice.dart';

GetIt locator = GetIt.instance;

void setuplocater() {
  locator.registerLazySingleton(() => WorldTimeService());
}