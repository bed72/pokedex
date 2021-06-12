enum DomainError {
  /// Pokemon
  unexpected,
  accessDenied
}

extension DomainErrorExtension on DomainError {
  String get descripition {
    switch (this) {
      case DomainError.unexpected:
        return 'Some unexpected error happened.';
      case DomainError.accessDenied:
        return 'Access Denied.';
      default:
        return 'An error has happened, please try later.';
    }
  }
}
