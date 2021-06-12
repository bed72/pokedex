abstract class HttpDefault<T> {
  Future<T> get(T parms);
  Future<T> put(T parms);
  Future<T> post(T parms);
  Future<T> patch(T parms);
  Future<T> delete(T parms);
}
