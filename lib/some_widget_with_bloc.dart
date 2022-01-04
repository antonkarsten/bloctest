import 'package:bloctest/bloc/app_bloc.dart';
import 'package:bloctest/bloc/app_events.dart';
import 'package:bloctest/bloc/app_states.dart';
import 'package:bloctest/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SomeWidgetWithBloc extends StatelessWidget {
  void Function() callback;

  SomeWidgetWithBloc({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Bloc Event with asynchronous handler that emits a state',
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<AppBloc>(context).add(AppEventSlowApiWithEmit());
              callback();
            },
            child: const Text('Go !'),
          ),
          const Text(
            'Bloc Event with asynchronous handler that adds an event',
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<AppBloc>(context).add(AppEventSlowApiWithAdd());
              callback();
            },
            child: const Text('Go !'),
          ),
          const Text(
            'Call Cubit function that emits a new state after the cubit has been closed (this will cause an Exception)',
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<AppCubit>(context).slowApiWithEmit();
              callback();
            },
            child: const Text('Go !'),
          ),
        ],
      );
    });
  }
}
