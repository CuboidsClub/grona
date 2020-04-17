import 'package:get_it/get_it.dart';
import 'package:grona/common/services/Authentication.dart';
import 'package:grona/common/services/Navigation.dart';
import 'package:grona/common/services/dialog.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Navigation());
  locator.registerLazySingleton(() => Authentication());
  locator.registerLazySingleton(() => ShowDialog());
}