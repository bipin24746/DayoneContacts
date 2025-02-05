part of 'auth_bloc.dart';

abstract class AuthState extends Equatable{
  const AuthState();
}

class AuthInitial extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthLoadingState extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthErrorState extends AuthState{
  final String errorMessage;
  const AuthErrorState({
    required this.errorMessage
});

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];

}

class AuthSuccessState extends AuthState{
  final AuthResponseEntity authResponseEntity;
  const AuthSuccessState({required this.authResponseEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [authResponseEntity];
}