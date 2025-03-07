part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // get url and anonKey from environment variables
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
  );

  // Register Supabase client
  serviceLocator
      .registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

// register connection checker
  serviceLocator.registerLazySingleton<ConnectionChecker>(
    () => ConnectionCheckerImpl(
      InternetConnection(),
    ),
  );
  // Initialize the project
  _initProject();
}

void _initProject() {
  // Register Repository
  serviceLocator
    ..registerFactory<ProjectRemoteDataSource>(
      () => ProjectRemoteDataSourceImpl(
        serviceLocator<SupabaseClient>(),
      ),
    )
    ..registerLazySingleton<ProjectRepository>(
      () => ProjectRepositoryImpl(
        supabase: serviceLocator<SupabaseClient>(),
        remoteDataSource: serviceLocator<ProjectRemoteDataSource>(),
        connectionChecker: serviceLocator<ConnectionChecker>(),
      ),
    )
    // use case
    ..registerLazySingleton<GetAllProjects>(
      () => GetAllProjects(
        serviceLocator<ProjectRepository>(),
      ),
    )
    ..registerLazySingleton<AddProject>(
      () => AddProject(
        serviceLocator<ProjectRepository>(),
      ),
    )
    // Bloc
    ..registerFactory(
      () => ProjectBloc(
        getAllProjects: serviceLocator<GetAllProjects>(),
      ),
    );
}
