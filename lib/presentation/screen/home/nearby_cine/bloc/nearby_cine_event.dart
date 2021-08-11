import 'package:equatable/equatable.dart';
import 'package:findseat/model/barrel_model.dart';


class NearbyCineEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DisplayNearbyCine extends NearbyCineEvent {
  final List<Cine> cines;

  DisplayNearbyCine({required this.cines});

  @override
  List<Object> get props => [cines];
}
