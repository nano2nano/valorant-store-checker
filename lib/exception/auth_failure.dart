class AuthenticationFailure implements Exception {
  final String message;
  const AuthenticationFailure(this.message);

  @override
  String toString() => message;
}
