import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/data/models/otp_response.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/presentation/bloc/otp_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'otp_event.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/domain/repositories/auth_repository.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthRepository authRepository;

  OtpBloc({required this.authRepository}) : super(OtpInitial()) {
    on<VerifyOtp>((event, emit) async {
      emit(OtpLoading());

      final result = await authRepository.verifyOtp(
        event.phoneNumber,
        event.otp,
        event.hash,
      );

      result.fold(
            (failure) => emit(OtpFailure(failure)), // failure is already a String
            (response) => emit(OtpSuccess(response as OtpResponse)), // response is LoginResponse
      );
    });
  }
}
