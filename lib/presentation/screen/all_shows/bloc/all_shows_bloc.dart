import 'package:findseat/model/api/response/api_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'package:findseat/model/entity/entity.dart';
import 'package:findseat/model/repo/repo.dart';
import 'package:findseat/presentation/screen/all_shows/bloc/bloc.dart';

class AllShowsBloc extends Bloc<AllShowsEvent, AllShowsState> {
  ShowRepository showRepository;
  SHOW_SORT_BY showSortBy = SHOW_SORT_BY.RATING;

  int sortByName(Show a, Show b) => a.name.compareTo(b.name);

  int sortByRating(Show a, Show b) => b.rate.compareTo(a.rate);

  AllShowsBloc({required this.showRepository})
      : super(DisplayListShows.loading());

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
    } else if (event is ClickIconSort) {
      yield* _mapClickIconSortToState();
    } else if (event is SortByChanged) {
      yield* _mapSortByChanged(event.showSortBy);
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
    yield DisplayListShows.loading();

    try {
      final response = await showRepository.getAllShowsByType();
      yield DisplayListShows.data(_metaFromResponse(response));
    } catch (e) {
      yield DisplayListShows.error(e.toString());
    }
  }

  Stream<AllShowsState> _mapSearchQueryChangedToState(String keyword) async* {
    yield DisplayListShows.loading();

    try {
      final response = await showRepository.getAllShowsByType();

      //this should be execute at server side
      bool query(Show show) =>
          keyword.isEmpty ||
          show.name.toLowerCase().contains(keyword.toLowerCase());

      response.nowShowing = response.nowShowing.where(query).toList();
      response.comingSoon = response.comingSoon.where(query).toList();
      response.exclusive = response.exclusive.where(query).toList();

      final meta = _metaFromResponse(response);

      yield DisplayListShows.data(meta);
    } catch (e) {
      yield DisplayListShows.error(e.toString());
    }
  }

  Stream<AllShowsState> _mapClickIconSortToState() async* {
    yield OpenSortOption(isOpen: true, showSortBy: showSortBy);
  }

  Stream<AllShowsState> _mapSortByChanged(SHOW_SORT_BY showSortBy) async* {
    this.showSortBy = showSortBy;

    yield UpdateToolbarState(showSearchField: false);

    yield* _mapSearchQueryChangedToState("");
  }

  Meta _metaFromResponse(AllShowsByTypeResponse response) {
    //this logic should be done at server side
    int Function(Show, Show) sortBy;
    if (showSortBy == SHOW_SORT_BY.NAME) {
      sortBy = sortByName;
    } else if (showSortBy == SHOW_SORT_BY.RATING) {
      sortBy = sortByRating;
    } else {
      sortBy = sortByName;
    }

    response.nowShowing.sort(sortBy);
    response.comingSoon.sort(sortBy);
    response.exclusive.sort(sortBy);

    return Meta(
      nowShowing: response.nowShowing,
      comingSoon: response.comingSoon,
      exclusive: response.exclusive,
    );
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
