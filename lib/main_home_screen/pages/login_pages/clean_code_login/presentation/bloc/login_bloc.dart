import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Dio _dio = Dio(); // Creating Dio instance for API calls

  LoginBloc() : super(LoginInitial()) {
    on<LoginRequestOtp>((event, emit) async {
      emit(LoginLoading()); // Set state to loading

      try {
        final response = await _dio.post(
          'https://housing-stagingserver.aitc.ai/api/v1/client/auth',
          data: {'contact': event.phoneNumber},
          options: Options(headers: {'Content-Type': 'application/json'}),
        );

        if (response.statusCode == 200) {
          final responseData = response.data;
          final success = responseData['success'];
          final message = responseData['message'];

          if (success) {
            emit(LoginSuccess(
              phone: responseData['data']['phone'],
              hash: responseData['data']['hash'],
            ));
          } else {
            emit(LoginFailure(message));
          }
        } else {
          emit(LoginFailure("Failed to send OTP. Please try again."));
        }
      } catch (e) {
        emit(LoginFailure("Something went wrong. Please check your network."));
      }
    });
  }
}
