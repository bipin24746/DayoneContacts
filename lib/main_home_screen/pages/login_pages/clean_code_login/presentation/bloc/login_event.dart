import 'package:equatable/equatable.dart';

// Abstract class for all events
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

// Event when the user requests an OTP
class LoginRequestOtp extends LoginEvent {
  final String phoneNumber;
  LoginRequestOtp({required this.phoneNumber});
}

