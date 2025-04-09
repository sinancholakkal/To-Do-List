import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pending_and_completed_event.dart';
part 'pending_and_completed_state.dart';

class PendingAndCompletedBloc extends Bloc<PendingAndCompletedEvent, PendingAndCompletedState> {
  PendingAndCompletedBloc() : super(PendingAndCompletedInitial()) {
    on<CountInitialEvent>((event, emit) {
      emit(CountLoadedState(pendingCount: event.pendingCount,completedCount: event.completedCount));
    });
  }
}
