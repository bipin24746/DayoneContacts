import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final bool isFormValid;
  final VoidCallback? submitForm;
  const SubmitButton({super.key,required this.isFormValid,required this.submitForm});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ElevatedButton(
          onPressed: isFormValid ? submitForm : null,
          style: ElevatedButton.styleFrom(
            backgroundColor:
            isFormValid ? Colors.blue : Colors.grey, // Optional
          ),
          child: const Text(
            "Submit",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
