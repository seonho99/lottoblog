import 'tab_navigation_state.dart';

sealed class TabNavigationEvent {}

final class TabChanged extends TabNavigationEvent {
  final NavItem selectedItem;

  TabChanged(this.selectedItem);
}

