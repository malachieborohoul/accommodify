import 'package:accommodation/features/home/data/datasources/accommodation_local_datasource.dart';
import 'package:accommodation/features/home/data/repositories/accommodation_repository_impl.dart';
import 'package:accommodation/features/home/domain/repositories/accommodation_repository.dart';
import 'package:accommodation/features/home/domain/usecases/accommodation_get_accommodations.dart';
import 'package:accommodation/features/home/presentation/bloc/accommodation_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:accommodation/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:accommodation/core/secrets/app_secrets.dart';
import 'package:accommodation/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:accommodation/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:accommodation/features/auth/domain/repositories/auth_repository.dart';
import 'package:accommodation/features/auth/domain/usecases/current_user.dart';
import 'package:accommodation/features/auth/domain/usecases/sign_up_with_apple.dart';
import 'package:accommodation/features/auth/domain/usecases/sign_up_with_google.dart';
import 'package:accommodation/features/auth/domain/usecases/user_sign_in.dart';
import 'package:accommodation/features/auth/domain/usecases/user_sign_out.dart';
import 'package:accommodation/features/auth/domain/usecases/user_sign_up.dart';
import 'package:accommodation/features/auth/presentation/bloc/auth_bloc.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

part 'init_dependencies.main.dart';