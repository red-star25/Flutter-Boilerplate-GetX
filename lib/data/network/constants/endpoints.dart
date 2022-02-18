class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://jsonplaceholder.typicode.com";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // post endpoints
  static const String getPosts = baseUrl + "/posts";

  // auth endpoints
  static const String login = baseUrl + '/login';
  static const String register = baseUrl + '/register';
  static const String logout = baseUrl + '/logout';
  static const String forgotPassword = baseUrl + '/forgot-password';
  static const String resetPassword = baseUrl + '/reset-password';
}
