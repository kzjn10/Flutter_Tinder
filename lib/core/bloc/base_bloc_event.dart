import 'package:meta/meta.dart';

abstract class BaseBlocEvent {
  BaseBlocEvent();

  @override
  String toString() => "BaseBlocEvent";
}

abstract class BaseRefreshEvent extends BaseBlocEvent {}

abstract class BaseFetchEvent extends BaseBlocEvent {}

abstract class BaseDefaultEvent extends BaseBlocEvent {}

abstract class BaseLoadingEvent extends BaseBlocEvent {}

class DefaultEvent extends BaseDefaultEvent {}

class LoadingEvent extends BaseLoadingEvent {}

class FetchEvent extends BaseFetchEvent {}

class RefreshEvent extends BaseRefreshEvent {}

class ReRenderEvent extends BaseBlocEvent {}

class EditBaseEvent extends BaseBlocEvent {
  final String id;
  final dynamic data;

  EditBaseEvent({this.id, this.data});
}

class AddBaseEvent extends BaseBlocEvent {
  final String id;
  final dynamic data;

  AddBaseEvent({this.id, this.data});
}

class DeleteBaseEvent extends BaseBlocEvent {
  final dynamic data;

  DeleteBaseEvent({this.data});
}

class FetchNextBatchEvent extends BaseFetchEvent {
  final int batchIndex;
  final int batchSize;

  FetchNextBatchEvent({@required this.batchIndex, @required this.batchSize});
}
