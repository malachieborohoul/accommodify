
import 'package:Accommodify/features/home/data/datasources/accommodation_remote_datasource.dart';
import 'package:Accommodify/features/home/data/repositories/accommodation_repository_impl.dart';
import 'package:Accommodify/features/home/domain/repositories/accommodation_repository.dart';
import 'package:Accommodify/features/home/domain/usecases/accommodation_get_accommodations.dart';
import 'package:Accommodify/features/home/presentation/bloc/accommodation_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:Accommodify/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:Accommodify/core/secrets/app_secrets.dart';
import 'package:Accommodify/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:Accommodify/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:Accommodify/features/auth/domain/repositories/auth_repository.dart';
import 'package:Accommodify/features/auth/domain/usecases/current_user.dart';
import 'package:Accommodify/features/auth/domain/usecases/sign_up_with_apple.dart';
import 'package:Accommodify/features/auth/domain/usecases/sign_up_with_google.dart';
import 'package:Accommodify/features/auth/domain/usecases/user_sign_in.dart';
import 'package:Accommodify/features/auth/domain/usecases/user_sign_out.dart';
import 'package:Accommodify/features/auth/domain/usecases/user_sign_up.dart';
import 'package:Accommodify/features/auth/presentation/bloc/auth_bloc.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

part 'init_dependencies.main.dart';