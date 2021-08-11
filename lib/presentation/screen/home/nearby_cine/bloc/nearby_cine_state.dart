import 'package:equatable/equatable.dart';
import 'package:findseat/model/barrel_model.dart';


class NearbyCineState extends Equatable {
  @override
  List<Object> get props => [];
}

class NearbyCineNotLoaded extends NearbyCineState {}

class NearbyCineLoaded extends NearbyCineState {
  final List<Cine> cines;

  NearbyCineLoaded({required this.cines});

  @override
  List<Object> get props => [cines];

  @override
  String toString() {
    return 'NearbyCineLoaded{cines: $cines}';
  }


}
