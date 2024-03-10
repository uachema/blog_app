import 'package:meta/meta.dart';

@immutable
sealed class Result {}

final class Success<T> extends Result {
  Success(this.data);
  final T data;
}

final class Failure extends Result {
  Failure([this.message = 'An unexpected error occurred']);

  final String message;
}
