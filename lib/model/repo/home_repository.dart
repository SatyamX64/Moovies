import 'package:dio/dio.dart';

import 'package:findseat/model/api/response/api_response.dart';
import 'package:findseat/model/api/rest_client.dart';

class HomeRepository {
  final dio = Dio();

  Future<HomeResponse> getHomeData() async {
    final client = RestClient(dio);
    return client.getHomeData();
  }
}
