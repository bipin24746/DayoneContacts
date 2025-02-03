import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/domain/entities/auth_entity.dart';
import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/domain/usecases/send_otp.dart';
import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/domain/usecases/verify_otp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SendOtp sendOtp;
  final VerifyOtp verifyOtp;

  AuthBloc({required this.sendOtp, required this.verifyOtp}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SendOtpEvent) {
      yield AuthLoading();
      try {
        final authEntity = await sendOtp(event.phone);
        yield OtpSent(authEntity);
      } catch (e) {
        yield AuthError(e.toString());
      }
    } else if (event is VerifyOtpEvent) {
      yield AuthLoading();
      try {
        final authEntity = await verifyOtp(event.hash, event.otp, event.phone);
        yield OtpVerified(authEntity);
      } catch (e) {
        yield AuthError(e.toString());
      }
    }
  }
}