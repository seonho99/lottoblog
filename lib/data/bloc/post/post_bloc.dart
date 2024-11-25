import 'package:flutter_bloc/flutter_bloc.dart';

import 'post_event.dart';
import 'post_state.dart';


class PostBloc extends Bloc<PostEvent,PostState>{
  PostBloc() : super(CounterInital()){
    on<IncreasedEvent>(_onIncreasedEvent);
    on<ReducedEvent>(_onReducedEvent);
  }

  void _onIncreasedEvent(IncreasedEvent event, Emitter<PostState> emit){
    emit(CounterChanged(state.counter+1));
  }

  void _onReducedEvent(ReducedEvent event, Emitter<PostState> emit){
    emit(CounterChanged(state.counter-1));
  }
}