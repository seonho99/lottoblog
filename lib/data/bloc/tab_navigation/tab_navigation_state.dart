sealed class TabNavigationState{}

final class TabInitialState extends TabNavigationState {}

final class TabChangedState extends TabNavigationState {
  final int selectedIndex;

  TabChangedState(this.selectedIndex);
}