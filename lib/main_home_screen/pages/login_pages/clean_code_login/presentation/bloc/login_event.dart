part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class LoginRequestOtp extends LoginEvent {
  final String phoneNumber;
  const LoginRequestOtp({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}
