enum CacheError {
  notFound,
  unexpected,
  invalidData,
}

extension CacheErrorExtension on CacheError {
  String get descripition {
    switch (this) {
      case CacheError.notFound:
        return 'Data note found.';
      case CacheError.unexpected:
        return 'Unexpected Data.';

      default:
        return 'An error has happened, please try later.';
    }
  }
}
