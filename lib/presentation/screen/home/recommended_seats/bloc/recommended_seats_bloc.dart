import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findseat/model/entity/show.dart';
import 'package:findseat/presentation/screen/home/bloc/bloc.dart';
import 'package:findseat/presentation/screen/home/recommended_seats/bloc/bloc.dart';

class RecommendedSeatsBloc
    extends Bloc<RecommendedSeatsEvent, RecommendedSeatsState> {
  final HomeBloc homeBloc;
  late StreamSubscription subscription;

  RecommendedSeatsBloc({required this.homeBloc})
      : super(RecommendedSeatsNotLoaded()) {
    void onHomeStateChanged(state) {
      if (state is HomeLoaded) {
        add(DisplayRecommendedSeats(state.response.recommendedSeats));
      }
    }

    onHomeStateChanged(homeBloc.state);
    subscription = homeBloc.stream.listen(onHomeStateChanged);
  }

  @override
  Stream<RecommendedSeatsState> mapEventToState(
      RecommendedSeatsEvent event) async* {
    if (event is DisplayRecommendedSeats) {
      yield* _mapDisplayRecommendedSeatsToState(event.shows);
    }
  }

  Stream<RecommendedSeatsState> _mapDisplayRecommendedSeatsToState(
      List<Show> shows) async* {
    yield RecommendedSeatsLoaded(shows);
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
