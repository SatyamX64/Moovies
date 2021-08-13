// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReview _$UserReviewFromJson(Map<String, dynamic> json) {
  return UserReview(
    json['author'] as String,
    json['created'] as int,
    json['content'] as String,
    json['avatar'] as String,
  );
}

Map<String, dynamic> _$UserReviewToJson(UserReview instance) =>
    <String, dynamic>{
      'author': instance.author,
      'created': instance.created,
      'content': instance.content,
      'avatar': instance.avatar,
    };
