

import 'package:accommodation/core/common/entities/user.dart';
import 'package:accommodation/core/utils/typedef.dart';

abstract interface class AuthRepository {
  ResultFuture<User> signUp({
    required String name,
    required String email,
    required String password,
  });

  ResultFuture<User> signIn({
    required String email,
    required String password,
  });


  ResultFuture<void> signOut();
  ResultFuture<User> signUpWithGoogle();
  // ResultFuture<User> signInWithGoogle();

  ResultFuture<User> signUpWithApple();



  ResultFuture<User> currentUser();
}
