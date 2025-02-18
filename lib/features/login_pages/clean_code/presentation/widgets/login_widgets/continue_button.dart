import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/presentation/bloc/login_bloc/auth_bloc.dart';

class BlocContinueButton extends StatelessWidget {
  final bool isPhoneNumberValid;
  final TextEditingController phoneNoController;

  const BlocContinueButton({
    super.key,
    required this.isPhoneNumberValid,
    required this.phoneNoController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        bottom: MediaQuery.of(context).viewInsets.bottom + 15,
      ),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          onPressed: isPhoneNumberValid
              ? () {
            // Trigger the event to authenticate the user
            context.read<AuthBloc>().add(AuthUserEvent(
              phoneNo: phoneNoController.text,
            ));
          }
              : null,
          child: const Text(
            "Continue",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
