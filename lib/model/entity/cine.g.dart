// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cine _$CineFromJson(Map<String, dynamic> json) {
  return Cine(
    json['id'] as String,
    json['name'] as String,
    json['address'] as String,
    json['rating'] as int,
    (json['distance'] as num).toDouble(),
    json['photo'] as String,
    (json['lat'] as num).toDouble(),
    (json['lng'] as num).toDouble(),
  );
}

Map<String, dynamic> _$CineToJson(Cine instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'rating': instance.rating,
      'distance': instance.distance,
      'photo': instance.photo,
      'lat': instance.lat,
      'lng': instance.lng,
    };
