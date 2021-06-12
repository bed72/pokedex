// import '../../../features/shared/cache/data/cache/cache_client.dart';

// import '../../../domain/helpers/cache/cache_error.dart';
// import '../../../domain/usecases/cache/cache_default_usecase.dart';

// class Cache implements CacheDefault {
//   late final CacheClient localCache;

//   Cache({
//     required this.localCache,
//   });

//   @override
//   Future<String> fetch({required String key}) async {
//     try {
//       final String? value = await localCache.fetch(key: 'travels@$key');
//       return value!;
//     } catch (error) {
//       throw CacheError.unexpected;
//     }
//   }

//   Future<void> save({required String key, required String value}) async {
//     try {
//       await localCache.save(key: 'travels@$key', value: value);
//     } catch (error) {
//       throw CacheError.unexpected;
//     }
//   }

//   @override
//   Future<void> remove({required String key}) async {
//     try {
//       await localCache.remove(key: 'travels@$key');
//     } catch (error) {
//       throw CacheError.unexpected;
//     }
//   }
// }
