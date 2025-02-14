// import 'package:dayonecontacts/features/login_pages/clean_code/presentation/widgets/login_widgets/phone_number_input.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dayonecontacts/features/login_pages/clean_code/presentation/bloc/login_bloc/auth_bloc.dart';
//
// class BlocLoginLogic extends StatefulWidget {
//   const BlocLoginLogic({super.key});
//
//   @override
//   State<BlocLoginLogic> createState() => _BlocLoginLogicState();
// }
//
// class _BlocLoginLogicState extends State<BlocLoginLogic> {
//   bool _isPhoneNumberValid = false;
//   final TextEditingController _phoneNoController = TextEditingController();
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
//     return BlocListener<AuthBloc, AuthState>(
//       listener: (context, state) {},
//       child: Column(
//         children: [
//           BlocPhoneNumberInput(phoneNoController: _phoneNoController),
//           BlocContinueButton(
//             isPhoneNumberValid: _isPhoneNumberValid,
//             phoneNoController: _phoneNoController,
//           ),
//         ],
//       ),
//     );
//   }
// }
