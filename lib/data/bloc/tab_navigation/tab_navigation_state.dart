enum NavItem{
  main,home,login,
  // personal
}

sealed class TabNavigationState {
  final NavItem selectedItem;

  TabNavigationState(this.selectedItem);
}

final class TabInitial extends TabNavigationState {
 TabInitial() : super(NavItem.main);
}

final class TabLoaded extends TabNavigationState {

  TabLoaded(NavItem selected) : super(selected);
}
