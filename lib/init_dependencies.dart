import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:portofolio_bloc_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:portofolio_bloc_app/features/projects/data/datasources/project_remote_data_source.dart';
import 'package:portofolio_bloc_app/features/projects/data/repositories/project_repository_impl.dart';
import 'package:portofolio_bloc_app/features/projects/domain/repositories/project_repository.dart';
import 'package:portofolio_bloc_app/features/projects/domain/usecases/add_project.dart';
import 'package:portofolio_bloc_app/features/projects/domain/usecases/get_all_projects.dart';
import 'package:portofolio_bloc_app/features/projects/presentation/bloc/project_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import dotenv
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/network/connection_checker.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/sign_in_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

part 'init_dependencies.main.dart';
