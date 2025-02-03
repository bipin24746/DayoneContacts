// lib/main_home_screen/pages/login_pages/clean_code_login/presentation/bloc/otp_event.dart

import 'package:equatable/equatable.dart';

abstract class OtpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class VerifyOtp extends OtpEvent {
  final String phoneNumber;
  final String otp;
  final String hash;

  VerifyOtp({required this.phoneNumber, required this.otp, required this.hash});

  @override
  List<Object> get props => [phoneNumber, otp, hash];
}
