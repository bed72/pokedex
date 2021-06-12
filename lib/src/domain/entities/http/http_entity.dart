import 'dart:typed_data';

import '../../../domain/entities/http/custom_response_entity.dart';

class HttpClientEntity
    extends CustomResponseEntity<Map<String, dynamic>, Uint8List> {
  HttpClientEntity(Map<String, dynamic>? body, Uint8List? bodyBytes)
      : super(body ?? {}, bodyBytes ?? [] as Uint8List);
}
