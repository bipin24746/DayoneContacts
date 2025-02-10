
// import 'package:dayonecontacts/main_home_screen/pages/home_screen_pages/home_screen.dart';
// import 'package:dayonecontacts/main_home_screen/pages/login_pages/widgets/pages/login_page.dart';
import 'package:dayonecontacts/main_home_screen/pages/home_screen_pages/home_screen.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/presentation/screens/login_page.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/widgets/pages/login_page.dart';
import 'package:flutter/material.dart';

// import 'main_home_screen/pages/login_pages/widgets/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const BlocLoginPage(),
      home: LoginPage(),
    );
  }
}



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
