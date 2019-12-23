import 'package:tinder/core/domain/contants/global.dart';

import 'base_exception.dart';

class FetchDataException extends BaseException {
  final _url;

  FetchDataException([String message, this._url]) : super(StatusCodes.FETCH_DATA, message);

  String toString() {
    if (message == null) return "FetchdataException";
    return "FetchdataException: $message - from Url: $_url";
  }
}
