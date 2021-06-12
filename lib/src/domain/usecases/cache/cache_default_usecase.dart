abstract class CacheDefault {
  Future<void> remove({required String key});
  Future<String> fetch({required String key});
  Future<void> save({required String key, required String value});
}
