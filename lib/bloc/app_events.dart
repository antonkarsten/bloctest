class AppEvent {}

class AppEventSlowApiWithEmit extends AppEvent {}

class AppEventSlowApiWithAdd extends AppEvent {}

class AppEventSlowApiSuccessEvent extends AppEvent {
  final apiResult;
  AppEventSlowApiSuccessEvent({required this.apiResult});
}
