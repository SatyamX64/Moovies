import 'package:findseat/model/api/rest_client.dart';
import 'package:findseat/model/repo/response/api_response.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  final dio = Dio();

  Future<HomeResponse> getHomeData() async {
    final client = RestClient(dio);
    return client.getHomeData();
  }
}
