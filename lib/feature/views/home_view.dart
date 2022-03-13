import 'package:firebase_login/feature/service/auth_service.dart';
import 'package:firebase_login/product/components/app_string.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: const Text(AppString.logoutButton),
        onPressed: () {
          _authService.signOut();
          Navigator.pop(context);
        },
      )),
    );
  }
}
