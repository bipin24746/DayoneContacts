
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/core/di/injection.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/presentation/bloc/notice_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dayonecontacts/router/app_router.dart';


void main() {
  // setupLocator(); // Initialize Dependency Injection
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<NoticeBloc>()),
      ],
      child: MaterialApp.router(
        title: 'To-Do App',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: _appRouter.config(), // Use AutoRoute
      ),
    );
  }
}

// import 'package:dayonecontacts/main_home_screen/pages/home_screen_pages/home_screen.dart';
// import 'package:dayonecontacts/main_home_screen/pages/login_pages/widgets/pages/login_page.dart';
// import 'package:dayonecontacts/features/invite_guest/widgets/addManuallyRefractored/SplashScreen.dart';
// import 'package:dayonecontacts/features/login_pages/clean_code/presentation/screens/login_page.dart';
// import 'package:dayonecontacts/main_home_screen/pages/home_screen_pages/home_screen.dart';
// import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle.dart';
// import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/vehicle_refractored/add_vehicle.dart';
// import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices.dart';
// import 'package:dayonecontacts/router/app_router.dart';
//
// import 'package:flutter/material.dart';
//
// // import 'main_home_screen/pages/login_pages/widgets/pages/login_page.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   MyApp({super.key});
// final _appRouter =AppRouter();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'To-Do App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       routerConfig: _appRouter.config(),
//       // home: const BlocLoginPage(),
//       // home: SplashScreen(),
//       // home: AllNotices(),
//       // home: AddVehicle(),
//     );
//   }
// }



//
// import 'package:dayonecontacts/main_home_screen/pages/home_screen_pages/home_screen.dart';
// import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/data/data_sources/auth_data_sources.dart';
// import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/data/repositories/auth_repo_impl.dart';
// import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/domain/repositories/auth_repository.dart';
// import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/presentation/screens/login_page.dart';
// import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/presentation/screens/otp_page.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/domain/usecases/auth_usecase.dart';
// import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/domain/repositories/otp_reponse_repo.dart';
// import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/data/repositories/verify_otp_repo_impl.dart';
// import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/data/data_sources/verify_otp_data_source.dart';
//
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         // Provide Dio instance
//         Provider<Dio>(create: (_) => Dio()),
//
//         // Provide the AuthDataSource instance, passing Dio to it
//         Provider<AuthDataSource>(
//           create: (context) => AuthDataSource(context.read<Dio>()), // Pass Dio to AuthDataSource
//         ),
//
//         // Provide AuthRepositoryImpl with the AuthDataSource instance
//         Provider<AuthRepository>(
//           create: (context) => AuthRepositoryImpl(
//             context.read<AuthDataSource>(), // Getting the AuthDataSource instance from Provider
//           ),
//         ),
//
//         // Provide AuthUseCase with the AuthRepository instance
//         Provider<AuthUseCase>(
//           create: (context) => AuthUseCase(authRepository: context.read<AuthRepository>()),
//         ),
//
//         // Provide VerifyOtpDataSourceImpl instead of abstract VerifyOtpDataSource
//         Provider<VerifyOtpDataSource>(
//           create: (context) => VerifyOtpDataSourceImpl(dio: context.read<Dio>()), // Provide concrete implementation
//         ),
//
//         // Provide VerifyOtpRepoImpl as before
//         Provider<OtpResponseRepo>(
//           create: (_) => VerifyOtpRepoImpl(verifyOtpDataSource: VerifyOtpDataSourceImpl(dio: Dio())),
//         ),
//       ],
//       child: MaterialApp(
//         title: 'Clean Code Login',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: LoginPage(),
//         routes: {
//           '/otp': (context) => OtpPage(phoneNo: '', hash: '',otp: '',),
//           '/home': (context) => HomeScreenMain(), // Create a HomePage or another screen
//         },
//       ),
//     );
//   }
// }
