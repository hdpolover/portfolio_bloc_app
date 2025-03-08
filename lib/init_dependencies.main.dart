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
  _initAuth();
}

void _initAuth() {
  // Register AuthRepository
  serviceLocator
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: serviceLocator<AuthRemoteDataSource>(),
        connectionChecker: serviceLocator<ConnectionChecker>(),
      ),
    )
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocator<SupabaseClient>(),
      ),
    )
    // use case
    ..registerLazySingleton<SignInUsecase>(
      () => SignInUsecase(
        serviceLocator<AuthRepository>(),
      ),
    )
    ..registerLazySingleton(
      () => AuthBloc(
        signInUsecase: serviceLocator<SignInUsecase>(),
      ),
    );
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
    ..registerLazySingleton<GetProjectById>(
      () => GetProjectById(
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
        getProjectById: serviceLocator<GetProjectById>(),
      ),
    );
}
