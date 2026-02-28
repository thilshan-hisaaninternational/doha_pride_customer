import 'package:doha_pride_customer/core/router/app_router.dart';
import 'package:doha_pride_customer/core/theme/app_theme.dart';
import 'package:doha_pride_customer/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:doha_pride_customer/features/auth/domain/repositories/auth_repository_impl.dart';
import 'package:doha_pride_customer/features/auth/domain/usecases/login.dart';
import 'package:doha_pride_customer/features/auth/domain/usecases/register.dart';
import 'package:doha_pride_customer/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: SystemUiOverlay.values, // show top (status) and bottom bars
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // no solid bar
      statusBarIconBrightness: Brightness.dark, // Android: dark icons
      statusBarBrightness: Brightness.light, // iOS: dark icons on light bg
    ),
  );

  final authRemote = AuthRemoteDataSource();
  final authRepository = AuthRepositoryImpl(authRemote);
  final loginUseCase = Login(authRepository);
  final registerUseCase = Register(authRepository);

  await di.initDependencies();
  runApp(
    BlocProvider(
      create: (context) =>
          AuthBloc(login: loginUseCase, register: registerUseCase),
      child: const DohaprideApp(),
    ),
  );
}

class DohaprideApp extends StatelessWidget {
  const DohaprideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp.router(
          title: "Doha Pride",
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
