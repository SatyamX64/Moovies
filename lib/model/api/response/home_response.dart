import 'package:findseat/model/entity/categoryy.dart';
import 'package:findseat/model/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  List<Banner> banners;
  List<Categoryy> categories;
  @JsonKey(name: "recommended_seats")
  List<Show> recommendedSeats;
  @JsonKey(name: "nearby_theatres")
  List<Cine> nearbyTheatres;
  HomeResponse(
      {required this.banners,
      required this.categories,
      required this.recommendedSeats,
      required this.nearbyTheatres});

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
