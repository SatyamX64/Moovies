import 'package:findseat/model/api/response/api_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://jsonkeeper.com/b/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/9KY8")
  Future<HomeResponse> getHomeData();

  @GET("/50R2")
  Future<AllShowsByTypeResponse> getAllShowsByType();
}
