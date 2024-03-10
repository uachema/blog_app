import 'package:blog_app/core/utils/result.dart';

abstract interface class UseCase<Params> {
  Future<Result> call(Params params);
}
