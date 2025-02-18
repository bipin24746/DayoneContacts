part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable{
  const AuthEvent();

}

class AuthUserEvent extends AuthEvent{

  final String phoneNo;
  const AuthUserEvent({
   required this.phoneNo
});

  @override
  // TODO: implement props
  List<Object?> get props => [phoneNo];
}