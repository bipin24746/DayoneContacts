// You may use the LoginEntity as a simple model
class LoginEntity {
  final String phone;
  final String otp;
  final String hash;

  LoginEntity({required this.phone, required this.otp, required this.hash});
}
