import 'dart:typed_data';

import 'base/http_custom_response_entity.dart';

class HttpClientEntity
    extends HttpCustomResponseEntity<Map<String, dynamic>, Uint8List> {
  HttpClientEntity(Map<String, dynamic>? body, Uint8List? bodyBytes)
      : super(body ?? {}, bodyBytes ?? [] as Uint8List);
}
