import 'package:equatable/equatable.dart';
import 'package:findseat/presentation/screen/all_shows/bloc/all_shows_bloc.dart';
import 'package:meta/meta.dart';

class AllShowsState extends Equatable {
  @override
  List<Object> get props => [];
}

class DisplayListShows extends AllShowsState {
  final Meta meta;

  DisplayListShows({required this.meta});

  @override
  List<Object> get props => [meta];

  @override
  String toString() {
    return 'DisplayListShows{meta: $meta}';
  }
}

class UpdateToolbarState extends AllShowsState {
  final bool showSearchField;

  UpdateToolbarState({required this.showSearchField});

  @override
  List<Object> get props => [showSearchField];

  @override
  String toString() {
    return 'UpdateSearchIconState{showSearchIcon: $showSearchField}';
  }
}

class LoadingData extends AllShowsState {}

class NoData extends AllShowsState {
  final String msg;

  NoData({required this.msg});

  @override
  List<Object> get props => [msg];

  @override
  String toString() {
    return 'NoData{msg: $msg}';
  }
}
