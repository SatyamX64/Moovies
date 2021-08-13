// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_by_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowByCategoryResponse _$ShowByCategoryResponseFromJson(
    Map<String, dynamic> json) {
  return ShowByCategoryResponse(
    categoryId: json['category_id'] as int,
    shows: (json['shows'] as List<dynamic>)
        .map((e) => Show.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ShowByCategoryResponseToJson(
        ShowByCategoryResponse instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'shows': instance.shows,
    };
