import 'package:flutter_bloc/flutter_bloc.dart';
import 'tab_navigation_event.dart';
import 'tab_navigation_state.dart';

class TabNavigationBloc extends Bloc<TabNavigationEvent, TabNavigationState> {
  TabNavigationBloc() : super(TabInitial()) {
    on<TabChanged>((event, emit) {
      emit(TabLoaded(event.selectedItem));
    });
  }
}
