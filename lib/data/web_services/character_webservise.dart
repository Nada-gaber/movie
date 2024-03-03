import 'package:dio/dio.dart';
import 'package:movie/constants/strings.dart';

class CharacterWebService {
  late Dio dio;

  CharacterWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacter() async {
    try {
      Response response = await dio.get('character');
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
