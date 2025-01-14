import 'package:Accommodify/core/common/entities/user.dart';
import 'package:Accommodify/core/usecase/usecase.dart';
import 'package:Accommodify/core/utils/typedef.dart';
import 'package:Accommodify/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';


class UserSignUp implements Usecase<User, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);
  @override
  ResultFuture<User> call(UserSignUpParams params) async{
    return await authRepository.signUp(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpParams extends Equatable {
  final String email;
  final String name;
  final String password;

  const UserSignUpParams(
      {required this.email, required this.name, required this.password});

  @override
  List<Object?> get props => [email, name, password];
}
