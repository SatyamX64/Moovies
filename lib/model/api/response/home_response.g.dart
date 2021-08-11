// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) {
  return HomeResponse(
    banners: (json['banners'] as List<dynamic>)
        .map((e) => Banner.fromJson(e as Map<String, dynamic>))
        .toList(),
    categories: (json['categories'] as List<dynamic>)
        .map((e) => Categoryy.fromJson(e as Map<String, dynamic>))
        .toList(),
    recommendedSeats: (json['recommended_seats'] as List<dynamic>)
        .map((e) => Show.fromJson(e as Map<String, dynamic>))
        .toList(),
    nearbyTheatres: (json['nearby_theatres'] as List<dynamic>)
        .map((e) => Cine.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'banners': instance.banners,
      'categories': instance.categories,
      'recommended_seats': instance.recommendedSeats,
      'nearby_theatres': instance.nearbyTheatres,
    };
