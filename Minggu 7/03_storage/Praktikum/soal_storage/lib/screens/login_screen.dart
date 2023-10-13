import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soal_storage/styles/global_text_style.dart';
import 'package:soal_storage/styles/text_color.dart';
import 'package:soal_storage/widgets/global_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late SharedPreferences loginData;
  late bool isUserLoggedIn;

  void isLoggedIn() async {
    loginData = await SharedPreferences.getInstance();
    isUserLoggedIn = loginData.getBool('isLoggedIn') ?? false;

    if (mounted) {
      if (isUserLoggedIn == true) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    }
  }

  @override
  void initState() {
    isLoggedIn();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
          backgroundColor: TextColor().m3sysLightPurple,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login', style: TextStyle(fontSize: 40)),
              const SizedBox(height: 26),
              GlobalTextField(
                  label: 'Username',
                  hint: 'Input Username',
                  errorMsg: '',
                  onChanged: (_) {},
                  controller: _usernameController),
              const SizedBox(height: 16),
              GlobalTextField(
                  label: 'Password',
                  hint: 'Input Password',
                  errorMsg: '',
                  onChanged: (_) {},
                  controller: _passwordController),
              const SizedBox(height: 22),
              ElevatedButton(
                  onPressed: () {
                    loginData.setBool('isLoggedIn', true);
                    loginData.setString('username', _usernameController.text);
                    loginData.setInt('contactLength', 0);
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TextColor().m3sysLightPurple,
                    disabledForegroundColor:
                        TextColor().m3sysWhite.withOpacity(0.42),
                    disabledBackgroundColor:
                        TextColor().m3sysLightPurple.withOpacity(0.20),
                  ),
                  child: Text(
                    'Submit',
                    style: GlobalTextStyle().m3LabelLarge,
                  )),
            ],
          ),
        ));
  }
}
