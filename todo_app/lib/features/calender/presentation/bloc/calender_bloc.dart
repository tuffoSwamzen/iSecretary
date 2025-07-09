import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calender_event.dart';
part 'calender_state.dart';

class CalenderBloc extends Bloc<CalenderEvent, CalenderState> {
  CalenderBloc() : super(CalenderInitial()) {
    on<CalenderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
