



import 'package:accommodation/core/usecase/usecase.dart';
import 'package:accommodation/core/utils/typedef.dart';
import 'package:accommodation/features/auth/domain/repositories/auth_repository.dart';

class CurrentUser implements UsecaseWithoutParams {
  final AuthRepository authRepository;

  CurrentUser(this.authRepository);
  @override
  ResultFuture call() async {
        return await authRepository.currentUser();

  }
}