import 'package:dio/dio.dart';
import 'package:suitmedia_test/models/user.dart';

class UserServices {
  final Dio _dio = Dio();

  Future<void> fetchUser(
    int page,
    bool isRefresh,
  ) async {
    try {
      var response =
          await _dio.get("https://reqres.in/api/users?page=$page&per_page=10");

      if (response.statusCode == 200) {
        // If the user refresh the data, the [allUser] will be completely deleted
        // else: add new data to current [allUser]
        if (isRefresh) {
          allUser = [];
        }
        for (var item in (response.data['data']) as List<dynamic>) {
          UserModel dataJson = UserModel.fromJson(item);

          //Add new data to [allUser]
          allUser.add(dataJson);
        }
        //total page the server have
        totalPage = response.data['total_pages'];
      }
    } catch (eror) {
      throw Exception(eror.toString());
    }
  }
}
