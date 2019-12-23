import 'base_equatable.dart';

abstract class BaseBlocState extends BaseEquatable {
  final bool isLoading;
  final String errorMsg;
  final bool isEmpty;
  final bool isHandleState;
  final int timeStamp;

  BaseBlocState({
    this.isLoading = false,
    this.isEmpty = false,
    this.isHandleState = false,
    this.errorMsg,
    this.timeStamp = 1,
  });

  bool get isError => errorMsg?.isNotEmpty == true;

  @override
  String toString() => "BaseBlocState";

  factory BaseBlocState.initialize() => DefaultState();

  @override
  List<Object> get props => [isLoading, isEmpty, isHandleState, errorMsg, timeStamp];
}

class AlwaysChangeBaseState extends BaseBlocState {
  AlwaysChangeBaseState([List props = const []]) : super(timeStamp: DateTime.now().millisecondsSinceEpoch);
}

class DefaultState extends AlwaysChangeBaseState {}

class ErrorState extends AlwaysChangeBaseState {}

class LoadingState extends AlwaysChangeBaseState {}

class EmptyState extends AlwaysChangeBaseState {}

class SaveBaseState extends AlwaysChangeBaseState {
  final bool isSuccess;
  final String message;

  SaveBaseState({this.isSuccess = true, this.message, List props = const []}) : super([isSuccess, message, props]);
}

class EditingBaseState extends AlwaysChangeBaseState {}

class EditBaseState extends AlwaysChangeBaseState {
  final bool isSuccess;
  final dynamic data;

  EditBaseState({this.isSuccess = false, this.data}) : super([isSuccess, data]);
}

class AddingBaseState extends AlwaysChangeBaseState {}

class AddBaseState extends AlwaysChangeBaseState {
  final bool isSuccess;
  final dynamic data;

  AddBaseState({this.isSuccess = false, this.data}) : super([isSuccess, data]);
}

class DeletingBaseState extends AlwaysChangeBaseState {}

class DeleteBaseState extends AlwaysChangeBaseState {
  final bool isSuccess;
  final dynamic data;

  DeleteBaseState({this.isSuccess = false, this.data}) : super([isSuccess, data]);
}
