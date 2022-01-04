import 'package:bloctest/bloc/app_events.dart';
import 'package:bloctest/bloc/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<AppEventSlowApiWithEmit>(_slowApiWithEmit);
    on<AppEventSlowApiWithAdd>(_slowApiWithAdd);
    on<AppEventSlowApiSuccessEvent>(_slowApiSuccess);
  }

  Future<void> _slowApiWithEmit(event, emit) async {
    await Future.delayed(const Duration(seconds: 1), () {
      print('emit state');
      emit(AppState());
    });
  }

  Future<void> _slowApiWithAdd(event, emit) async {
    await Future.delayed(const Duration(seconds: 1), () {
      print('emit event');

      add(AppEventSlowApiSuccessEvent(apiResult: 'some kind of value'));
    });
  }

  void _slowApiSuccess(AppEventSlowApiSuccessEvent event, emit) async {
    /// Here we can emit the result
    emit(AppState(someValue: event.apiResult));
  }

  @override
  Future<void> close() async {
    print('The App Bloc has been closed');
  }
}
