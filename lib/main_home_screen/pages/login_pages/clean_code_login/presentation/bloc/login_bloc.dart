import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/data/models/login_response.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/domain/entity/login_entity.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/domain/repositories/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginRequestOtp>((event, emit) async {
      emit(LoginLoading());
      try {
        // Perform login and request OTP.
        final loginData = await loginUseCase(event.phoneNumber);

        // Debug log the login response data
        print('OTP: ${loginData.otp}');
        print('Hash: ${loginData.hash}');
        print('Phone: ${loginData.phone}');
        print('Device ID: ${loginData.deviceId}');
        print('FCM Token: ${loginData.fcmToken}');
        print('Device Type: ${loginData.deviceType}');

        emit(LoginSuccess(
          loginData: convertToLoginResponse(loginData),
          phone: loginData.phone,
          hash: loginData.hash,
        ));

      } catch (e) {
        emit(LoginFailure(error: e.toString()));
      }
    });
  }

  // Convert LoginEntity to LoginResponse
  LoginResponse convertToLoginResponse(LoginEntity loginEntity) {
    return LoginResponse(
      phoneNumber: loginEntity.phoneNumber,
      hash: loginEntity.hash,
      otp: loginEntity.otp,
      phone: loginEntity.phone,
      deviceId: loginEntity.deviceId,
      fcmToken: loginEntity.fcmToken,
      deviceType: loginEntity.deviceType, message: '',
    );
  }
}
