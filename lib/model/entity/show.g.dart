// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Show _$ShowFromJson(Map<String, dynamic> json) {
  return Show(
    json['id'] as String,
    json['name'] as String,
    json['thumb'] as String,
    json['cover'] as String,
    json['trailer'] as String,
    json['rate'] as int,
    json['votes'] as String,
    (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    json['duration'] as int,
    (json['offers'] as List<dynamic>)
        .map((e) => Offer.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['total_reviews'] as int,
    UserReview.fromJson(json['latest_reviews'] as Map<String, dynamic>),
    (json['casts'] as List<dynamic>)
        .map((e) => Cast.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ShowToJson(Show instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumb': instance.thumb,
      'cover': instance.cover,
      'trailer': instance.trailer,
      'rate': instance.rate,
      'votes': instance.votes,
      'tags': instance.tags,
      'duration': instance.duration,
      'offers': instance.offers,
      'total_reviews': instance.totalReviews,
      'latest_reviews': instance.latestReviews,
      'casts': instance.casts,
    };
