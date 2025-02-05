// login_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/domain/domain_usecases/send_otp_usecase.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/domain/domain_usecases/phone_validation_usecase.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/presentation/bloc/login_event.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/presentation/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SendOtpUseCase sendOtpUseCase;
  final PhoneValidationUseCase phoneValidationUseCase;

  LoginBloc({
    required this.sendOtpUseCase,
    required this.phoneValidationUseCase,
  }) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is PhoneNumberChanged) {
      final isValid = phoneValidationUseCase.validatePhoneNumber(event.phoneNumber);

      if (isValid) {
        yield PhoneNumberValid(event.phoneNumber);
      } else {
        yield PhoneNumberInvalid(event.phoneNumber);
      }
    } else if (event is SendOtpRequested) {
      try {
        final response = await sendOtpUseCase.sendOtp(event.phoneNumber);
        yield OtpSent(response.otp, response.hash);
      } catch (e) {
        yield OtpSendError();
      }
    }
  }
}
