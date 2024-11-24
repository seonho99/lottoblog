import 'package:flutter_bloc/flutter_bloc.dart';

import 'like_event.dart';
import 'like_state.dart';


class LikeBloc extends Bloc<LikeEvent,LikeState>{
  LikeBloc() : super(CounterInital()){
    on<IncreasedEvent>(_onIncreasedEvent);
    on<ReducedEvent>(_onReducedEvent);
  }

  void _onIncreasedEvent(IncreasedEvent event, Emitter<LikeState> emit){
    emit(CounterChanged(state.counter+1));
  }

  void _onReducedEvent(ReducedEvent event, Emitter<LikeState> emit){
    emit(CounterChanged(state.counter-1));
  }
}