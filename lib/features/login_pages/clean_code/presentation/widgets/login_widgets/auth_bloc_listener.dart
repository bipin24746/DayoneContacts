import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/presentation/bloc/login_bloc/auth_bloc.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/presentation/screens/otp_page.dart';

class AuthBlocListener extends StatelessWidget {
  final TextEditingController phoneNoController;

  const AuthBlocListener({Key? key, required this.phoneNoController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Otp Sent Successfully.")),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpPage(
                hash: state.authResponseEntity.authResponseDataEntity?.hash ?? '',
                otp: state.authResponseEntity.authResponseDataEntity?.otp ?? '',
                phoneNo: phoneNoController.text,
              ),
            ),
          );
        } else if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.errorMessage}')),
          );
        }
      },
      child: Container(),
    );
  }
}
