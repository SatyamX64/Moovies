// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_show_by_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllShowsByTypeResponse _$AllShowsByTypeResponseFromJson(
    Map<String, dynamic> json) {
  return AllShowsByTypeResponse(
    (json['now_showing'] as List<dynamic>)
        .map((e) => Show.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['coming_soon'] as List<dynamic>)
        .map((e) => Show.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['exclusive'] as List<dynamic>)
        .map((e) => Show.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AllShowsByTypeResponseToJson(
        AllShowsByTypeResponse instance) =>
    <String, dynamic>{
      'now_showing': instance.nowShowing,
      'coming_soon': instance.comingSoon,
      'exclusive': instance.exclusive,
    };
