// import 'package:shared_preferences/shared_preferences.dart';

// import '../../features/shared/cache/data/cache/cache_client.dart';

// class CacheAdapter implements CacheClient {
//   late final SharedPreferences sharedPreference;

//   CacheAdapter({
//     required this.sharedPreference,
//   });

//   Future<void> save({
//     required String key,
//     required String value,
//   }) async {
//     await sharedPreference.remove(key);
//     await sharedPreference.setString(key, value);
//   }

//   Future<void> remove({required String key}) async {
//     await sharedPreference.remove(key);
//   }

//   Future<String?> fetch({required String key}) async {
//     return sharedPreference.getString(key);
//   }
// }
