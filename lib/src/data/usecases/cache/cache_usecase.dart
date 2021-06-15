import '../../../data/cache/cache_client.dart';

import '../../../domain/helpers/cache/cache_error.dart';
import '../../../domain/usecases/cache/cache_default_usecase.dart';

class Cache implements CacheDefault {
  late final CacheClient localCache;
  late final String appKey = 'travels@';

  Cache({
    required this.localCache,
  });

  @override
  Future<String?> fetch({required String key}) async {
    try {
      final value = await localCache.fetch(key: '$appKey$key');
      return value;
    } catch (error) {
      throw CacheError.unexpected;
    }
  }

  Future<void> save({
    required String key,
    required String value,
  }) async {
    try {
      await localCache.save(key: '$appKey$key', value: value);
    } catch (error) {
      throw CacheError.unexpected;
    }
  }

  @override
  Future<void> remove({required String key}) async {
    try {
      await localCache.remove(key: '$appKey$key');
    } catch (error) {
      throw CacheError.unexpected;
    }
  }

  @override
  Future<void> clear() async {
    try {
      await localCache.clear();
    } catch (error) {
      throw CacheError.unexpected;
    }
  }
}
