import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'package:findseat/model/entity/entity.dart';
import 'package:findseat/model/repo/repo.dart';
import 'package:findseat/presentation/screen/all_shows/bloc/bloc.dart';

class AllShowsBloc extends Bloc<AllShowsEvent, AllShowsState> {
  ShowRepository showRepository;

  AllShowsBloc({required this.showRepository}) : super(LoadingData());

  @override
  Stream<AllShowsState> mapEventToState(AllShowsEvent event) async* {
    if (event is OpenScreen) {
      yield UpdateToolbarState(showSearchField: false);
      yield* _mapOpenScreenToState();
    } else if (event is ClickIconSearch) {
      yield UpdateToolbarState(showSearchField: true);
    } else if (event is ClickCloseSearch) {
      yield UpdateToolbarState(showSearchField: false);
      yield* _mapSearchQueryChangedToState("");
    } else if (event is SearchQueryChanged) {
      yield* _mapSearchQueryChangedToState(event.keyword);
    }
  }

  @override
  Stream<Transition<AllShowsEvent, AllShowsState>> transformEvents(
      Stream<AllShowsEvent> events,
      Stream<Transition<AllShowsEvent, AllShowsState>> Function(AllShowsEvent)
          next) {
    final nonDebounceStream = events.where((event) {
      return (event is! SearchQueryChanged);
    });

    final debounceStream = events.where((event) {
      return (event is SearchQueryChanged);
    }).debounceTime(Duration(milliseconds: 400));

    return super
        .transformEvents(nonDebounceStream.mergeWith([debounceStream]), next);
  }

  Stream<AllShowsState> _mapOpenScreenToState() async* {
    yield LoadingData();

    try {
      final response = await showRepository.getAllShowsByType();
      yield DisplayListShows(
          meta: Meta(
        nowShowing: response.nowShowing,
        comingSoon: response.comingSoon,
        exclusive: response.exclusive,
      ));
    } catch (e) {
      yield NoData(msg: e.toString());
    }
  }

  Stream<AllShowsState> _mapSearchQueryChangedToState(String keyword) async* {
    yield LoadingData();

    try {
      final response = await showRepository.getAllShowsByType();

      //this should be execute at server side
      bool query(Show show) =>
          keyword.isEmpty ||
          show.name.toLowerCase().contains(keyword.toLowerCase());

      yield DisplayListShows(
        meta: Meta(
          nowShowing: response.nowShowing.where(query).toList(),
          comingSoon: response.comingSoon.where(query).toList(),
          exclusive: response.exclusive.where(query).toList(),
        ),
      );
    } catch (e) {
      yield NoData(msg: e.toString());
    }
  }
}

class Meta {
  List<Show> nowShowing;
  List<Show> comingSoon;
  List<Show> exclusive;

  Meta(
      {required this.nowShowing,
      required this.comingSoon,
      required this.exclusive});
}
