import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'log_out_event.dart';
part 'log_out_state.dart';

class LogOutBloc extends Bloc<LogOutEvent, LogOutState> {
  LogOutBloc() : super(LogOutInitial()) {
    on<LogOutEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
