import 'package:bloc/bloc.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/domain/usecases/login_usecase.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/presentation/bloc/login_event.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/presentation/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial());

  @override
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginRequestOtp) {
      yield LoginLoading();
      final result = await loginUseCase.login(event.phoneNumber);

      result.fold(
            (failure) => emit(LoginFailure(error: failure)),
            (loginResponse) => emit(LoginSuccess(loginResponse: loginResponse)),
      );
    }
  }

}
