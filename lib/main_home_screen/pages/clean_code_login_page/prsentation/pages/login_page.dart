import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/domain/usecases/send_otp.dart';
import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/domain/usecases/verify_otp.dart';
import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/prsentation/blocs/auth_bloc.dart';

BlocProvider(
create: (context) => AuthBloc(
sendOtp: getIt<SendOtp>(),
verifyOtp: getIt<VerifyOtp>(),
),
child: LoginPage(),
);