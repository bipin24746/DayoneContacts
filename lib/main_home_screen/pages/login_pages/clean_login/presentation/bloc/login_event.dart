// Define the event to handle phone number changes
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PhoneNumberChanged extends LoginEvent {
  final String phoneNumber;

  PhoneNumberChanged(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class SendOtpRequested extends LoginEvent {
  final String phoneNumber;

  SendOtpRequested(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

