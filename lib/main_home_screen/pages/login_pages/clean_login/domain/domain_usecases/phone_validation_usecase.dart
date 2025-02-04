// phone_validation_usecase.dart
class PhoneValidationUseCase {
  // Example of a phone number validation method
  bool validatePhoneNumber(String phoneNumber) {
    // You can customize this logic to match the format you need
    final phoneRegExp = RegExp(r'^\+?[1-9]\d{1,14}$'); // For international phone numbers
    return phoneRegExp.hasMatch(phoneNumber);
  }
}
