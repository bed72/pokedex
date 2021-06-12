import '../../domain/entities/http/http_entity.dart';

abstract class HttpClient {
  Future<HttpClientEntity> request({
    required String url,
    required String method,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  });
}
