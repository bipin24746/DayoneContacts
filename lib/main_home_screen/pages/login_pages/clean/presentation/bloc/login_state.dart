import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class PhoneNumberValid extends LoginState {
  final String phoneNumber;

  PhoneNumberValid(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class OtpSent extends LoginState {
  final String otp;
  final String hash;

  OtpSent(this.otp, this.hash);

  @override
  List<Object?> get props => [otp, hash];
}
