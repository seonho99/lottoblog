abstract class LikeState {
  final int counter;
  LikeState(this.counter);
}

class CounterInital extends LikeState{
  CounterInital() : super(0);
}

class CounterChanged extends LikeState{
  CounterChanged(int counter) : super(counter);
}