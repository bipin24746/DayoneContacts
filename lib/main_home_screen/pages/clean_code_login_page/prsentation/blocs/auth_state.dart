part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class OtpSent extends AuthState {
  final AuthEntity authEntity;

  OtpSent(this.authEntity);
}

class OtpVerified extends AuthState {
  final AuthEntity authEntity;

  OtpVerified(this.authEntity);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}