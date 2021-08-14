import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import 'entity.dart';

part 'show.g.dart';

@JsonSerializable()
class Show extends Equatable {
  final String id;
  final String name;
  final String thumb;
  // final String cover;
  final String trailer;
  final int rate;
  final String votes;
  final List<String> tags;
  final int duration;
  final List<Offer> offers;
  @JsonKey(name: "total_reviews")
  final int totalReviews;
  @JsonKey(name: "latest_reviews")
  final UserReview latestReviews;
  final List<Cast> casts;

  Show(
      this.id,
      this.name,
      this.thumb,
      // this.cover,
      this.trailer,
      this.rate,
      this.votes,
      this.tags,
      this.duration,
      this.offers,
      this.totalReviews,
      this.latestReviews,
      this.casts);

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);

  Map<String, dynamic> toJson() => _$ShowToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return 'Show{id: $id, name: $name, thumb: $thumb, cover: cover, trailer: $trailer, rate: $rate, votes: $votes, tags: $tags, duration: $duration, offers: $offers, totalReviews: $totalReviews, latestReviews: $latestReviews, casts: $casts}';
  }
}
