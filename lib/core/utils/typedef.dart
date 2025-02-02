import 'package:Accommodify/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
