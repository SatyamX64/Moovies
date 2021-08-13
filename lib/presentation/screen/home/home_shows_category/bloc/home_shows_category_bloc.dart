import 'dart:async';

import 'package:findseat/model/entity/categoryy.dart';
import 'package:findseat/model/entity/entity.dart';
import 'package:findseat/presentation/screen/home/bloc/bloc.dart';
import 'package:findseat/presentation/screen/home/home_shows_category/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeShowsCategoryBloc
    extends Bloc<HomeShowsCategoryEvent, HomeShowsCategoryState> {
  HomeBloc homeBloc;
  late StreamSubscription subscription;

  HomeShowsCategoryBloc({required this.homeBloc})
      : super(ShowsByCategoryNotLoaded()) {
    subscription = homeBloc.stream.listen((state) {
      void onHomeStateChanged(state) {
        if (state is HomeLoaded) {
          add(DisplayShowsByCategory(state.response));
        }
      }

      onHomeStateChanged(homeBloc.state);
      subscription = homeBloc.stream.listen(onHomeStateChanged);
    });
  }

  @override
  Stream<HomeShowsCategoryState> mapEventToState(
      HomeShowsCategoryEvent event) async* {
    if (event is DisplayShowsByCategory) {
      var list = <MapEntry<Categoryy, List<Show>>>[];

      final homeResponse = event.homeResponse;
      homeResponse.showByCategories.forEach((data) {
        final category = homeResponse.categories
            .firstWhere((category) => category.id == data.categoryId);
        list.add(MapEntry(category, data.shows));
      });

      yield ShowsByCategoryLoaded(list: list);
    }
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
