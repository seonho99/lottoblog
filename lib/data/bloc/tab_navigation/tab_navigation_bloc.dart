import 'package:flutter_bloc/flutter_bloc.dart';
import 'tab_navigation_event.dart';
import 'tab_navigation_state.dart';

class TabNavigationBloc extends Bloc<TabNavigationEvent, TabNavigationState> {
  TabNavigationBloc() : super(TabInitialState()) {
    on<TabChangedEvent>((event, emit) {
      emit(TabChangedState(event.index));
    });
  }
}
