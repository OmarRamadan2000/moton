import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = "https://nabiltabanga.pythonanywhere.com";
  final String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAyNDM4MzAxLCJpYXQiOjE3MDI0MzIzMDEsImp0aSI6IjNmYWRiN2ZjODBjOTQyZTZhZjY4N2U4NzkyNjc1ZjRlIiwidXNlcl9pZCI6MX0.AFv8ILO8vByQYd1Xy2Usz_pwcD6_ONs1Eu8jr3lVS-0";
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var options = Options(
      headers: {
        'Authorization': 'Bearer $token'
      }, // Include the token in the headers
    );

    var response = await _dio.get('$baseUrl$endPoint', options: options);

    return response.data;
  }
}
