sealed class TabNavigationEvent {}

final class TabChangedEvent extends TabNavigationEvent {
  final int index;

  TabChangedEvent(this.index);
}
