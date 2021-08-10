import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findseat/model/entity/categoryy.dart';
import 'package:findseat/presentation/screen/home/bloc/bloc.dart';

import 'bloc.dart';

class HomeCategoryBloc extends Bloc<HomeCategoriesEvent, HomeCategoriesState> {
  HomeBloc homeBloc;
  late StreamSubscription subscription;

  HomeCategoryBloc({required this.homeBloc})
      : super(HomeCategoriesNotLoaded()) {
    void onHomeStateChanged(state) {
      if (state is HomeLoaded) {
        add(DisplayHomeCategories(state.response.categories));
      }
    }

    onHomeStateChanged(homeBloc.state);
    subscription = homeBloc.stream.listen(onHomeStateChanged);
  }

  @override
  Stream<HomeCategoriesState> mapEventToState(
      HomeCategoriesEvent event) async* {
    if (event is DisplayHomeCategories) {
      yield* _mapDisplayHomeCategoriesToState(event.categories);
    }
  }

  Stream<HomeCategoriesState> _mapDisplayHomeCategoriesToState(
      List<Categoryy> categories) async* {
    yield HomeCategoriesLoaded(categories);
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
