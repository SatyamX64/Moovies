import 'package:findseat/model/entity/categoryy.dart';
import 'package:findseat/model/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'api_response.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  List<Banner> banners;
  List<Categoryy> categories;
  @JsonKey(name: "recommended_seats")
  List<Show> recommendedSeats;
  @JsonKey(name: "nearby_theatres")
  List<Cine> nearbyTheatres;
  @JsonKey(name: "show_by_categories")
  List<ShowByCategoryResponse> showByCategories;
  HomeResponse(
      {required this.banners,
      required this.categories,
      required this.recommendedSeats,
      required this.nearbyTheatres,
      required this.showByCategories});

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
