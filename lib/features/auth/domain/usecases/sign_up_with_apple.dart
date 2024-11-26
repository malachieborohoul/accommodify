import 'package:accommodation/core/common/entities/user.dart';
import 'package:accommodation/core/usecase/usecase.dart';
import 'package:accommodation/core/utils/typedef.dart';
import 'package:accommodation/features/auth/domain/repositories/auth_repository.dart';


class SignUpWithApple implements UsecaseWithoutParams {
  final AuthRepository repository;

  SignUpWithApple(this.repository);
  @override
  ResultFuture<User> call() async {
    return await repository.signUpWithApple();
  }
}
