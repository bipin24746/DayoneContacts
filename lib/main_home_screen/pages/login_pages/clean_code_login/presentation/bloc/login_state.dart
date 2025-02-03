// lib/main_home_screen/pages/login_pages/clean_code_login/presentation/bloc/login_state.dart
import 'package:equatable/equatable.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/data/models/login_response.dart';  // Import LoginResponse

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

// Initial state
class LoginInitial extends LoginState {}

// Loading state
class LoginLoading extends LoginState {}

// Success state after login
class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;  // Store the LoginResponse

  LoginSuccess({required this.loginResponse});

  @override
  List<Object> get props => [loginResponse];  // Include loginResponse in the props for comparison
}

// Failure state
class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});

  @override
  String toString() => error;
}
