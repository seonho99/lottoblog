sealed class TabNavigationEvent {
  const TabNavigationEvent();
}

final class TabChangedEvent extends TabNavigationEvent {
  final int index;

  TabChangedEvent(this.index);
}
