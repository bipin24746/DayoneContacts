import 'package:dayonecontacts/main_home_screen/pages/login_pages/otp_verification.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/widgets/api_modules/modules.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _numberController = TextEditingController();

  bool isNumFieldValid = false;
  void initState() {
    super.initState();
    _numberController.addListener(_numberValidate);
  }

  void _numberValidate() {
    final isValid = _numberController.text.isNotEmpty &&
        int.tryParse(_numberController.text) != null &&
        _numberController.text.length == 10;

    if (isNumFieldValid != isValid) {
      setState(() {
        isNumFieldValid = isValid;
      });
    }
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

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
            icon: Icon(
              Icons.arrow_back,
              size: 35,
            ),
          ),
          flexibleSpace: SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image(
                image: AssetImage("lib/assets/images/signupimage.png"),
              ),
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                        child: Icon(
                          Icons.flag,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _numberController,
                        decoration: InputDecoration(
                          labelText: "Mobile Number",
                          floatingLabelStyle:
                              const TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors
                                  .black, // The border color when not focused
                            ),
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
          bottom: MediaQuery.of(context).viewInsets.bottom +
              15, // Adjust padding based on keyboard
        ),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: isNumFieldValid
                ? () async {
                    try {
                      ApiService apiService = ApiService();
                      final response =
                          await apiService.login(_numberController.text);
                      if (response['success']) {
                        print("Sucessed");
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successful")));
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OtpVerificationPage(
                                number: _numberController.text)));
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to send otp")));
                      print("failed");
                    }
                    // {
                    //   // Navigator.of(context).push(
                    //   //   MaterialPageRoute(
                    //   //     builder: (context) =>
                    //   //         OtpVerificationPage(number: _numberController.text),
                    //   //   ),
                    //   // );
                    // }
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
    );
  }
}
