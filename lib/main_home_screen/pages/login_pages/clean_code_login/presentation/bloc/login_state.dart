part of 'login_bloc.dart';



abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse loginData;  // Assuming `LoginResponse` is your data type
  final String phone;
  final String hash;

  const LoginSuccess({
    required this.loginData,   // Add the loginData parameter
    required this.phone,
    required this.hash,
  });

  @override
  List<Object> get props => [loginData, phone, hash];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});
}
