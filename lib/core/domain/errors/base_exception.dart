
abstract class BaseException implements Exception {

  final _message;
  final _code;

  BaseException(this._code, this._message);

  get message => _message;
  get code => _code;

}