class CustomResponseEntity<B, T> {
  late final B body;
  late final T bodyBytes;

  CustomResponseEntity(
    this.body,
    this.bodyBytes,
  );

  factory CustomResponseEntity.fromResponse(B body, T bodyBytes) {
    return CustomResponseEntity(body, bodyBytes);
  }
}
