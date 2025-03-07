import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:portofolio_bloc_app/features/landing_page/projects/data/datasources/project_remote_data_source.dart';
import 'package:portofolio_bloc_app/features/landing_page/projects/data/repositories/project_repository_impl.dart';
import 'package:portofolio_bloc_app/features/landing_page/projects/domain/repositories/project_repository.dart';
import 'package:portofolio_bloc_app/features/landing_page/projects/domain/usecases/add_project.dart';
import 'package:portofolio_bloc_app/features/landing_page/projects/domain/usecases/get_all_projects.dart';
import 'package:portofolio_bloc_app/features/landing_page/projects/presentation/bloc/project_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import dotenv
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/network/connection_checker.dart';

part 'init_dependencies.main.dart';
