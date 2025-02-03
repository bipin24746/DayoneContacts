part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SendOtpEvent extends AuthEvent {
  final String phone;

  SendOtpEvent(this.phone);
}

class VerifyOtpEvent extends AuthEvent {
  final String hash;
  final String otp;
  final String phone;

  VerifyOtpEvent(this.hash, this.otp, this.phone);
}