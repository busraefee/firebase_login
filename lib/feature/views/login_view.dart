import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/feature/service/auth_service.dart';
import 'package:firebase_login/feature/views/home_view.dart';
import 'package:firebase_login/product/components/app_color.dart';
import 'package:firebase_login/product/components/app_string.dart';
import 'package:firebase_login/product/widgets/custom_formfield.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    mailField(),
                    const SizedBox(
                      height: 10,
                    ),
                    passwordField(),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(child: loginButton(context)),
            ],
          ),
        ),
      ),
    );
  }

  CustomFormField mailField() {
    return CustomFormField(
      controller: _emailController,
      inputType: TextInputType.emailAddress,
      name: AppString.loginMail,
    );
  }

  CustomFormField passwordField() {
    return CustomFormField(
      controller: _passwordController,
      name: AppString.loginPass,
      inputType: TextInputType.visiblePassword,
      obscureText: true,
    );
  }

  ElevatedButton loginButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColor.loginButton,
        ),
        onPressed: () async {
          _buildLogin();
        },
        child: const Text(
          AppString.loginButton,
          style: TextStyle(
            fontSize: 20,
          ),
        ));
  }

  void errorLogin() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text(AppString.alertError)));
  }

  void _buildLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _authService
          .signIn(_emailController.text, _passwordController.text)
          .then((value) {
        if (value != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeView()));
        } else {
          errorLogin();
        }
        return null;
      });
    }
  }
}
