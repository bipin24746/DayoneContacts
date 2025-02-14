// import 'package:dayonecontacts/features/login_pages/clean_code/presentation/widgets/login_widgets/continue_button.dart';
// import 'package:dayonecontacts/features/login_pages/clean_code/presentation/widgets/login_widgets/phone_number_input.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dayonecontacts/features/login_pages/clean_code/presentation/bloc/login_bloc/auth_bloc.dart';
// import 'package:dayonecontacts/features/login_pages/clean_code/presentation/screens/otp_page.dart';
// import 'package:dayonecontacts/features/login_pages/clean_code/data/data_sources/auth_data_sources.dart';
// import 'package:dayonecontacts/features/login_pages/clean_code/data/repositories/auth_repo_impl.dart';
// import 'package:dayonecontacts/features/login_pages/clean_code/domain/usecases/auth_usecase.dart';
// import 'package:dio/dio.dart';
//
// class BlocLoginPage extends StatefulWidget {
//   const BlocLoginPage({super.key});
//
//   @override
//   State<BlocLoginPage> createState() => _BlocLoginPageState();
// }
//
// class _BlocLoginPageState extends State<BlocLoginPage> {
//   final TextEditingController _phoneNoController = TextEditingController();
//   bool _isPhoneNumberValid = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _phoneNoController.addListener(_validatePhoneNumber);
//   }
//
//   void _validatePhoneNumber() {
//     final isValid = _phoneNoController.text.isNotEmpty &&
//         int.tryParse(_phoneNoController.text) != null &&
//         _phoneNoController.text.length == 10;
//
//     if (_isPhoneNumberValid != isValid) {
//       setState(() {
//         _isPhoneNumberValid = isValid;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _phoneNoController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AuthBloc(
//         authUseCase: AuthUseCase(
//           authRepository: AuthRepositoryImpl(AuthDataSource(Dio())),
//         ),
//       ),
//       child: BlocListener<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is AuthSuccessState) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => OtpPage(
//                   hash: state.authResponseEntity.authResponseDataEntity?.hash ?? '',
//                   otp: state.authResponseEntity.authResponseDataEntity?.otp ?? '',
//                   phoneNo: _phoneNoController.text,
//                 ),
//               ),
//             );
//           } else if (state is AuthErrorState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Error: ${state.errorMessage}')),
//             );
//           }
//         },
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           appBar: PreferredSize(
//             preferredSize: Size.fromHeight(200),
//             child: AppBar(
//               backgroundColor: Colors.white,
//               leading: IconButton(
//                 onPressed: () {},
//                 icon: Icon(Icons.arrow_back, size: 35),
//               ),
//               flexibleSpace: Padding(
//                 padding: const EdgeInsets.only(top: 15.0),
//                 child: Image.asset("lib/assets/images/signupimage.png"),
//               ),
//             ),
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 BlocPhoneNumberInput(phoneNoController: _phoneNoController),
//                 BlocContinueButton(
//                   isPhoneNumberValid: _isPhoneNumberValid,
//                   phoneNoController: _phoneNoController,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:dayonecontacts/features/login_pages/clean_code/data/data_sources/auth_data_sources.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/data/repositories/auth_repo_impl.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/domain/usecases/auth_usecase.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/presentation/bloc/login_bloc/auth_bloc.dart';
import 'package:dayonecontacts/features/login_pages/clean_code/presentation/screens/otp_page.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocLoginPage extends StatefulWidget {
  const BlocLoginPage({super.key});

  @override
  State<BlocLoginPage> createState() => _BlocLoginPageState();
}

class _BlocLoginPageState extends State<BlocLoginPage> {
  final TextEditingController _phoneNoController = TextEditingController();
  bool _isPhoneNumberValid = false;

  @override
  void initState() {
    super.initState();
    _phoneNoController.addListener(_validatePhoneNumber);
  }

  void _validatePhoneNumber() {
    final isValid = _phoneNoController.text.isNotEmpty &&
        int.tryParse(_phoneNoController.text) != null &&
        _phoneNoController.text.length == 10;

    if (_isPhoneNumberValid != isValid) {
      setState(() {
        _isPhoneNumberValid = isValid;
      });
    }
  }

  @override
  void dispose() {
    _phoneNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        authUseCase: AuthUseCase(
          authRepository: AuthRepositoryImpl(AuthDataSource(Dio())),
        ),
      ),
      child: Builder(
        builder: (context) {
          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Otp Sent Successfully."),
                  ),
                );
                // Navigate to OTP verification page on success
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpPage(
                      hash: state.authResponseEntity.authResponseDataEntity
                              ?.hash ??
                          '',
                      otp: state
                              .authResponseEntity.authResponseDataEntity?.otp ??
                          '',
                      phoneNo: _phoneNoController.text,
                    ),
                  ),
                );
              } else if (state is AuthErrorState) {
                // Show error message if authentication fails
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${state.errorMessage}')),
                );
              } else if (state is AuthLoadingState) {
                // Optional: show loading indicator or spinner if needed
                // You could show a progress indicator here
              }
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(200),
                child: AppBar(
                  backgroundColor: Colors.white,
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back, size: 35),
                  ),
                  flexibleSpace: SizedBox(
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Image.asset("lib/assets/images/signupimage.png"),
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BEGIN YOUR JOURNEY TO HOME",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "Please enter your mobile number to create your account.",
                        style: TextStyle(fontSize: 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Icon(Icons.flag, color: Colors.red),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: _phoneNoController,
                                decoration: InputDecoration(
                                  labelText: "Mobile Number",
                                  floatingLabelStyle:
                                      const TextStyle(color: Colors.black),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 15,
                ),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                    onPressed: _isPhoneNumberValid
                        ? () {
                            // Trigger the event to authenticate the user
                            context.read<AuthBloc>().add(AuthUserEvent(
                                phoneNo: _phoneNoController.text));
                          }
                        : null,
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
