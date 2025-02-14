import 'package:flutter/material.dart';

class BlocLoginContainer extends StatelessWidget {
  const BlocLoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
