import 'package:equatable/equatable.dart';
import 'package:findseat/model/entity/categoryy.dart';
import 'package:findseat/model/entity/entity.dart';

class HomeShowsCategoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class ShowsByCategoryNotLoaded extends HomeShowsCategoryState {}

class ShowsByCategoryLoaded extends HomeShowsCategoryState {
  final List<MapEntry<Categoryy, List<Show>>> list;

  ShowsByCategoryLoaded({required this.list});

  @override
  List<Object> get props => [list];
}
