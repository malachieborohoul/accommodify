import 'package:Accommodify/core/common/entities/user.dart';
import 'package:Accommodify/core/usecase/usecase.dart';
import 'package:Accommodify/core/utils/typedef.dart';
import 'package:Accommodify/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';


class UserSignIn implements Usecase<User, UserSignInParams> {
  final AuthRepository authRepository;

  UserSignIn(this.authRepository);

  @override
  ResultFuture<User> call(UserSignInParams params) async {
    return await authRepository.signIn(
        email: params.email, password: params.password);
  }
}

class UserSignInParams extends Equatable {
  final String email;
  final String password;

  const UserSignInParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
