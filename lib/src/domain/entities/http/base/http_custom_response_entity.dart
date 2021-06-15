class HttpCustomResponseEntity<B, T> {
  late final B body;
  late final T bodyBytes;

  HttpCustomResponseEntity(
    this.body,
    this.bodyBytes,
  );

  factory HttpCustomResponseEntity.fromResponse(B body, T bodyBytes) {
    return HttpCustomResponseEntity(body, bodyBytes);
  }
}
