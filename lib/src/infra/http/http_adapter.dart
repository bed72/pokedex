import 'dart:convert';

import 'package:http/http.dart';
import 'package:modular/src/domain/entities/http/http_entity.dart';

import '../../data/http/http_client.dart';

import '../../domain/helpers/http/http_error.dart';

class HttpAdapter implements HttpClient {
  late final Client client;

  HttpAdapter({
    required this.client,
  });

  @override
  Future<HttpClientEntity> request({
    required String url,
    required String method,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    final jsonBody = body != null ? jsonEncode(body) : null;
    final defaultHeader = header?.cast<String, String>() ?? {}
      ..addAll({
        'accept': 'application/json',
        'content-type': 'application/json',
      });
    Future<Response> futureResponse;
    Response response = Response('', 500);

    try {
      if (method == 'get') {
        futureResponse = client.get(Uri.parse(url), headers: defaultHeader);
      } else if (method == 'put') {
        futureResponse =
            client.put(Uri.parse(url), headers: defaultHeader, body: jsonBody);
      } else if (method == 'post') {
        futureResponse =
            client.post(Uri.parse(url), headers: defaultHeader, body: jsonBody);
      } else if (method == 'patch') {
        futureResponse = client.patch(Uri.parse(url),
            headers: defaultHeader, body: jsonBody);
      } else {
        futureResponse = client.patch(Uri.parse(url), headers: defaultHeader);
      }

      response = await futureResponse.timeout(Duration(seconds: 10));
    } catch (error) {
      throw HttpError.serverError;
    }

    return _response(response);
  }

  HttpClientEntity _response(Response response) {
    final _httpClientEntity =
        HttpClientEntity(jsonDecode(response.body), response.bodyBytes);

    switch (response.statusCode) {
      case 200:
        return _httpClientEntity;
      case 204:
        return _httpClientEntity;
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 403:
        throw HttpError.forbidden;
      case 404:
        throw HttpError.notFound;
      default:
        throw HttpError.serverError;
    }
  }
}
