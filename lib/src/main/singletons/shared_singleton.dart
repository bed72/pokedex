import 'package:shared_preferences/shared_preferences.dart';

class SharedSingleton {
  SharedSingleton._();

  late final SharedPreferences _preferences;

  static final SharedSingleton _instance = SharedSingleton._();
  static SharedSingleton get instance => _instance;

  factory SharedSingleton() {
    return _instance;
  }

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  SharedPreferences get preferences => _preferences;
}
