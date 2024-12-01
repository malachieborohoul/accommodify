

import 'package:Accommodify/core/usecase/usecase.dart';
import 'package:Accommodify/core/utils/typedef.dart';
import 'package:Accommodify/features/auth/domain/repositories/auth_repository.dart';


class UserSignOut implements UsecaseWithoutParams<void> {
  final AuthRepository authRepository;

  UserSignOut(this.authRepository);
  @override
  ResultFuture<void> call() async{
    return await authRepository.signOut();
  }
}

