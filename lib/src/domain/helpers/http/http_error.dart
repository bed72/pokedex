enum HttpError {
  /// Http
  notFound,
  forbidden,
  badRequest,
  serverError,
  invalidData,
  unauthorized,
}

extension HttpErrorExtension on HttpError {
  String get descripition {
    switch (this) {
      case HttpError.notFound:
        return 'Data note found.';
      case HttpError.forbidden:
        return 'Access forbidden.';
      case HttpError.badRequest:
        return 'Bad Request.';
      case HttpError.serverError:
        return 'Server Error.';
      case HttpError.serverError:
        return 'Invalid Data.';
      case HttpError.serverError:
        return 'Access Unauthorized.';
      default:
        return 'An error has happened, please try later.';
    }
  }
}
