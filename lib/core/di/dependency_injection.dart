import 'package:dio/dio.dart';
import 'package:doctor_appointment/core/networks/api_service.dart';
import 'package:doctor_appointment/core/networks/dio_factory.dart';
import 'package:doctor_appointment/features/login/data/repos/login_repo.dart';
import 'package:doctor_appointment/features/login/logic/login_cubit.dart';
import 'package:doctor_appointment/features/signUp/data/repos/sign_up_repository.dart';
import 'package:doctor_appointment/features/signUp/logic/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // dio & api services
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  // SignUp
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  getIt
      .registerLazySingleton<SignUpRepository>(() => SignUpRepository(getIt()));

  // home
}
