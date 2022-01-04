import 'package:bloctest/cubit/app_cubit.dart';
import 'package:bloctest/some_widget_with_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_bloc.dart';

class SomeWidgetWithAProvider extends StatelessWidget {
  void Function() callback;
  SomeWidgetWithAProvider({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (context) => AppBloc(),
          ),
          BlocProvider<AppCubit>(
            create: (BuildContext context) => AppCubit(),
          ),
        ],
        child: SomeWidgetWithBloc(callback: () {
          callback();
        }));
  }
}
