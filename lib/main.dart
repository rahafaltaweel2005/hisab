import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiasb_app/features/auth/data/datasource/auth_remote_datasource_imp.dart';
import 'package:hiasb_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:hiasb_app/features/auth/domain/usecase/login_use_case.dart';
import 'package:hiasb_app/features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:hiasb_app/features/auth/presentation/logout/cubit/logout_cubit.dart';
import 'package:hiasb_app/features/auth/presentation/register/cubit/register_cubit.dart';
import 'package:hiasb_app/features/auth/presentation/register/view/register_screen.dart';

import 'core/app_setting/theme/app_theme.dart';
import 'core/network/api_client.dart';
import 'features/auth/domain/usecase/logout_use_case.dart';
import 'features/auth/domain/usecase/register_use_case.dart';
import 'features/profile/data/datasources/profile_remote_data_source_imp.dart';
import 'features/profile/data/repository/profile_repository_imp.dart';
import 'features/profile/domain/usecase/get_profile_use_case.dart';
import 'features/profile/presentation/cubit/profile_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiClient.init();

  final authRemoteDatasource = AuthRemoteDatasourceImp();

  final authRepository = AuthRepositoryImpl(
    authRemoteDatasource: authRemoteDatasource,
  );

  final registerUseCase = RegisterUseCase(authRepository: authRepository);
  final loginUseCase = LoginUseCase(authRepository: authRepository);
  final logoutUseCase = LogoutUseCase(authRepository: authRepository);

  final profileRemoteDataSource = ProfileRemoteDataSourceImp();

  final profileRepository = ProfileRepositoryImp(
    profileRemoteDataSource: profileRemoteDataSource,
  );

  final getProfileUseCase = GetProfileUseCase(
    profileRepository: profileRepository,
  );
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => RegisterCubit(registerUseCase: registerUseCase),
          ),
          BlocProvider(create: (_) => LoginCubit(loginUseCase: loginUseCase)),
          BlocProvider(
            create: (_) => LogoutCubit(logoutUseCase: logoutUseCase),
          ),
          BlocProvider(
            create: (_) => ProfileCubit(getProfileUseCase: getProfileUseCase),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      home: RegisterScreen(),
    );
  }
}
