abstract class PostState {
  final int counter;
  PostState(this.counter);
}

class CounterInital extends PostState{
  CounterInital() : super(0);
}

class CounterChanged extends PostState{
  CounterChanged(int counter) : super(counter);
}