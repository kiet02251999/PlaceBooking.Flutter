class Endpoints {
  Endpoints._();

  static const int receiveTimeout = 5000;
  static const int connectionTimeout = 3000;

  //static const String apiUrl = 'http://10.0.2.2:3000/api';
  static const String apiUrl = 'http://10.0.2.2:3000';
  //static const String apiUrl = 'https://6459df095980.ngrok.io/api';

  static const String categories = '$apiUrl/categories';
}
