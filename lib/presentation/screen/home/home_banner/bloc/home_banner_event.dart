
import 'package:equatable/equatable.dart';
import 'package:findseat/model/entity/entity.dart';

class HomeBannerEvent extends Equatable {
  const HomeBannerEvent();

  @override
  List<Object> get props => [];
}

class DisplayHomeBanner extends HomeBannerEvent {
  final List<Banner> banners;

  DisplayHomeBanner({required this.banners});

  @override
  List<Object> get props => [banners];
}