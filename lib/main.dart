import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiasb_app/features/auth/data/datasource/auth_remote_datasource_impl.dart';
import 'package:hiasb_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:hiasb_app/features/auth/domain/usecase/login_use_case.dart';
import 'package:hiasb_app/features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:hiasb_app/features/auth/presentation/logout/cubit/logout_cubit.dart';
import 'package:hiasb_app/features/auth/presentation/register/cubit/register_cubit.dart';
import 'package:hiasb_app/features/projects/data/repository/project_repository_impl.dart';

import 'core/app_setting/theme/app_theme.dart';
import 'core/constant/app_const.dart';
import 'core/network/api_client.dart';
import 'core/storage/secure_storage_helper.dart';
import 'features/auth/domain/usecase/logout_use_case.dart';
import 'features/auth/domain/usecase/register_use_case.dart';
import 'features/auth/presentation/view/auth_screen.dart';
import 'features/home/presentation/view/home_screen.dart';
import 'features/profile/data/datasource/profile_remote_data_source_impl.dart';
import 'features/profile/data/repository/profile_repository_imp.dart';
import 'features/profile/domain/usecase/get_profile_use_case.dart';
import 'features/profile/presentation/cubit/profile_cubit.dart';
import 'features/projects/data/datasource/project_remote_datasource_impl.dart';
import 'features/projects/domain/usecase/add_project_use_case.dart';
import 'features/projects/domain/usecase/delete_project_use_case.dart';
import 'features/projects/domain/usecase/get_project_by_id_use_case.dart';
import 'features/projects/domain/usecase/get_projects_use_case.dart';
import 'features/projects/domain/usecase/update_project_use_case.dart';
import 'features/projects/presentation/addproject/cubit/add_project_cubit.dart';
import 'features/projects/presentation/deleteproject/cubit/delete_project_cubit.dart';
import 'features/projects/presentation/getprojectbyid/cubit/get_project_by_id_cubit.dart';
import 'features/projects/presentation/getprojects/cubit/get_projects_cubit.dart';

Future<bool> _hasValidToken() async {
  final token = await SecureStorageHelper.read(key: AppConst.accessTokenKey);
  if (token == null || token.isEmpty) return false;

  final expiry = DateTime.tryParse(
    await SecureStorageHelper.read(key: AppConst.tokenExpiryKey) ?? '',
  );
  if (expiry == null || expiry.isBefore(DateTime.now())) {
    await SecureStorageHelper.delete(key: AppConst.accessTokenKey);
    await SecureStorageHelper.delete(key: AppConst.tokenExpiryKey);
    return false;
  }
  return true;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiClient.init();
  final isLoggedIn = await _hasValidToken();

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

  final projectRemoteDatasource = ProjectRemoteDatasourceImpl();

  final projectRepository = ProjectRepositoryImpl(
    projectRemoteDatasource: projectRemoteDatasource,
  );

  final getProjectsUseCase = GetProjectsUseCase(
    projectRepository: projectRepository,
  );
  final addProjectUseCase = AddProjectUseCase(
    projectRepository: projectRepository,
  );
  final updateProjectUseCase = UpdateProjectUseCase(
    projectRepository: projectRepository,
  );
  final getProjectByIdUseCase = GetProjectByIdUseCase(
    projectRepository: projectRepository,
  );
  final deleteProjectUseCase = DeleteProjectUseCase(
    projectRepository: projectRepository,
  );
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('ar'),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: updateProjectUseCase),
        ],
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
            BlocProvider(
              create: (_) =>
                  GetProjectsCubit(getProjectsUseCase: getProjectsUseCase),
            ),
            BlocProvider(
              create: (_) =>
                  AddProjectCubit(addProjectUseCase: addProjectUseCase),
            ),
            BlocProvider(
              create: (_) => GetProjectByIdCubit(
                getProjectByIdUseCase: getProjectByIdUseCase,
              ),
            ),
            BlocProvider(
              create: (_) =>
                  DeleteProjectCubit(deleteProjectUseCase: deleteProjectUseCase),
            ),
          ],
          child: MyApp(isLoggedIn: isLoggedIn),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      home: isLoggedIn ? HomeScreen() : AuthScreen(),
    );
  }
}
