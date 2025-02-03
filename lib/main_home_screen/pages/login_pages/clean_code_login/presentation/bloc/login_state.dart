import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

// Initial state
class LoginInitial extends LoginState {}

// Loading state
class LoginLoading extends LoginState {}

// OTP sent successfully
class LoginSuccess extends LoginState {
  final String phone;
  final String hash;

  LoginSuccess({required this.phone, required this.hash});

  @override
  List<Object> get props => [phone, hash];
}

// Failure state
class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}
