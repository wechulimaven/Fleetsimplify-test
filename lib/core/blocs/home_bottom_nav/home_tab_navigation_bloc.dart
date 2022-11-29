import 'package:bloc/bloc.dart';
import 'package:dagizo_app/core/blocs/home_bottom_nav/home_tab_navigation_event.dart';

class BottomNavBloc extends Bloc<HomeTabNavigationEvent, int> {
  BottomNavBloc() : super(0) {
    on<NavigateToAnotherTab>((event, emit) {
      if (state != event.index) {
        emit(event.index);
      }
    });
  }
}
