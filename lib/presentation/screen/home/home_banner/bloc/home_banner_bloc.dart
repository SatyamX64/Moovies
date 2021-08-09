import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findseat/model/entity/banner.dart';
import 'package:findseat/presentation/screen/home/bloc/bloc.dart';
import 'package:findseat/presentation/screen/home/home_banner/bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

class HomeBannerBloc extends Bloc<HomeBannerEvent, HomeBannerState> {
  final HomeBloc homeBloc;
  late StreamSubscription subscription;

  HomeBannerBloc({required this.homeBloc}) : super(HomeBannerNotLoaded()) {
    void onHomeStateChanged(state) {
      if (state is HomeLoaded) {
        add(DisplayHomeBanner(banners: state.response.banners));
      }
    }

    onHomeStateChanged(homeBloc.state);
    subscription = homeBloc.stream.listen(onHomeStateChanged);
  }

  @override
  Stream<HomeBannerState> mapEventToState(HomeBannerEvent event) async* {
    if (event is DisplayHomeBanner) {
      yield* _mapDisplayHomeBannerToState(event.banners);
    }
  }

  Stream<HomeBannerState> _mapDisplayHomeBannerToState(
      List<Banner> banners) async* {
    yield HomeBannerLoaded(banners: banners);
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
