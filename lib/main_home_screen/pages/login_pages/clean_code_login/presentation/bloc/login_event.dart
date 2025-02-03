import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginRequestOtp extends LoginEvent {
  final String phoneNumber;

  LoginRequestOtp(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}
