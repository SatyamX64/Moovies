import 'dart:async';

import 'package:findseat/model/entity/cine.dart';
import 'package:findseat/presentation/screen/home/bloc/bloc.dart';
import 'package:findseat/presentation/screen/home/nearby_cine/bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NearbyCineBloc extends Bloc<NearbyCineEvent, NearbyCineState> {
  final HomeBloc homeBloc;
  late StreamSubscription subscription;

  NearbyCineBloc({required this.homeBloc}) : super(NearbyCineNotLoaded()) {
    void onHomeStateChanged(state) {
      if (state is HomeLoaded) {
        add(DisplayNearbyCine(cines: state.response.nearbyTheatres));
      }
    }

    onHomeStateChanged(homeBloc.state);
    subscription = homeBloc.stream.listen(onHomeStateChanged);
  }

  @override
  Stream<NearbyCineState> mapEventToState(NearbyCineEvent event) async* {
    if (event is DisplayNearbyCine) {
      yield* _mapDisplayNearbyCineToState(event.cines);
    }
  }

  Stream<NearbyCineState> _mapDisplayNearbyCineToState(
      List<Cine> cines) async* {
    yield NearbyCineLoaded(cines: cines);
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
