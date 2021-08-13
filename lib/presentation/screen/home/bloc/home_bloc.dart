import 'package:findseat/model/repo/home_repository.dart';
import 'package:findseat/presentation/screen/home/bloc/bloc.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeLoading());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadHome) {
      yield* _mapLoadHomeToState();
    }
  }

  Stream<HomeState> _mapLoadHomeToState() async* {
    try {
      final response = await homeRepository.getHomeData();
      yield HomeLoaded(response);
    } catch (e) {
      
      yield HomeNotLoaded(e.toString());
    }
  }
}
