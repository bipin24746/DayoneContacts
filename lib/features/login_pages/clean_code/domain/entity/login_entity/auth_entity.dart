import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable{
  final String phoneNo;
  const AuthEntity({
    required this.phoneNo
});

  @override
  // TODO: implement props
  List<Object?> get props => [phoneNo];
}