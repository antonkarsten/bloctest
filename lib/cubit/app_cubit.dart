import 'package:bloctest/bloc/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  Future<void> slowApiWithEmit() async {
    await Future.delayed(const Duration(seconds: 1), () {
      print('emit state in cubit');
      emit(AppState());
    });
  }

  @override
  Future<void> close() async {
    print('The App Cubit has been closed');
    super.close();
  }
}
