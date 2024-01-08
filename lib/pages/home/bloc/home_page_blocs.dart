import 'package:cursos/pages/home/bloc/home_page_events.dart';
import 'package:cursos/pages/home/bloc/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBlocs extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBlocs() : super(const HomePageStates()) {
    on<HomePageDots>(_homePageDots);
  }

  void _homePageDots(HomePageDots event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(index: event.index));
  }
}
