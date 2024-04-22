import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingletonAsync<SharedPreferences>(() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences;
  });
}
