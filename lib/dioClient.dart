import 'package:dio/dio.dart';
import 'package:kicker_finder/user.dart';
import 'dart:developer' as developer;

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'https://reqres.in/api';

  Future<User?> getUser({required String id}) async {
    User? user;
    try {
      Response userData = await _dio.get(_baseUrl + '/users/$id');
      developer.log('User Info: ${userData.data}');
      user = User.fromJson(userData.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        developer.log('Dio error!');
        developer.log('STATUS: ${e.response?.statusCode}');
        developer.log('DATA: ${e.response?.data}');
        developer.log('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        developer.log('Error sending request!');
        developer.log(e.message);
      }
    }
    return user;
  }
}