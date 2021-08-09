import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'banner.g.dart';

@JsonSerializable()
class Banner extends Equatable {
  final int id;
  final String image;

  Banner({required this.id, required this.image});

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

  Map<String, dynamic> toJson() => _$BannerToJson(this);

  @override
  List<Object> get props => [id, image];

  @override
  String toString() {
    return 'Banner{id: $id, image: $image}';
  }
}
