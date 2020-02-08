import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() async{
  //! Features - Number Trivia
  //Bloc
  sl.registerFactory(
    () => NumberTriviaBloc(
      concrete: sl(),
      random: sl(),
      inputConverter: sl(),
    ),
  );

// Use cases
  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

// Repository
sl.registerLazySingleton<NumberTriviaRepository>(
  () => NumberTriviaRepositoryImpl(
    remoteDataSource: sl(),
    localDataSource: sl(),
    networkInfo: sl(),
  ),
);


// Data sources
sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
  () => NumberTriviaRemoteDataSourceImpl(client: sl()),
);

sl.registerLazySingleton<NumberTriviaLocalDataSource>(
  () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()),
);


  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() async => await SharedPreferences.getInstance());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
