



import 'package:Accommodify/core/usecase/usecase.dart';
import 'package:Accommodify/core/utils/typedef.dart';
import 'package:Accommodify/features/auth/domain/repositories/auth_repository.dart';

class CurrentUser implements UsecaseWithoutParams {
  final AuthRepository authRepository;

  CurrentUser(this.authRepository);
  @override
  ResultFuture call() async {
        return await authRepository.currentUser();

  }
}