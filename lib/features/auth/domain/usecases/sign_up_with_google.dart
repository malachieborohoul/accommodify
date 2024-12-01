

import 'package:Accommodify/core/common/entities/user.dart';
import 'package:Accommodify/core/usecase/usecase.dart';
import 'package:Accommodify/core/utils/typedef.dart';
import 'package:Accommodify/features/auth/domain/repositories/auth_repository.dart';

class SignUpWithGoogle implements UsecaseWithoutParams {
  final AuthRepository repository;

  SignUpWithGoogle(this.repository);
  @override
  ResultFuture<User> call()async {
     return await repository.signUpWithGoogle();
  }
}