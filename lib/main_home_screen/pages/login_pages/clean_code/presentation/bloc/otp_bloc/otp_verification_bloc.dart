import 'dart:developer';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/core/shared_prefs_const.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/domain/entity/otp_entity/otp_entity.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/domain/entity/otp_entity/otp_response_entity.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/domain/usecases/otp_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'otp_verification_event.dart';
part 'otp_verification_state.dart';

class OtpVerificationBloc
    extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  final OtpUseCase otpUseCase;

  // Constructor accepting OtpUseCase directly
  OtpVerificationBloc({
    required this.otpUseCase,
  }) : super(OtpVerificationInitial()) {
    on<OtpVerificationUserEvent>(_otpVerificationUserEvent);
  }

  FutureOr<void> _otpVerificationUserEvent(
      OtpVerificationUserEvent event,
      Emitter<OtpVerificationState> emit,
      ) async {
    emit(OtpVerificationLoadingState());
    final errors = <String, dynamic>{};

    if (errors.isEmpty) {
      final otpVerificationUser = await otpUseCase.call(
        OtpEntity(
          phoneNo: event.phoneNo,
          otp: event.otp,
          hash: event.hash,
          deviceId: event.deviceId,
          deviceType: event.deviceType,
          fcmToken: event.fcmToken,
        ),
      );

      await otpVerificationUser.fold((failure) {
        log('this is error state ############');
        // final error = failure as SignInFailure;

        emit(
          OtpVerificationErrorState(
            // errorMessage: error.signInError.message,
            errorMessage: 'error',
          ),
        );
      }, (r) async {
        log('otp response from bloc $r');
        final prefs = await SharedPreferences.getInstance();

        log('-------hash is now: ${r.otpData}');

        // await prefs.setString(
        //   SharedPrefConstants.token,
        //   r.otpData.accessToken,
        // );
        //
        // await prefs.setString(
        //   SharedPrefConstants.refreshToken,
        //   r.otpData.refreshToken,
        // );
        // await prefs.remove(SharedPrefConstants.hashValue);
        // emit(
        //   OtpVerificationSuccessState(
        //     otpResponse: r,
        //   ),
        // );
      });
    }
  }
}