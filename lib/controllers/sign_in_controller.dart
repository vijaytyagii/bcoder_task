import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vijay_test1/body/login_data.dart';
import 'package:vijay_test1/const/error_snack.dart';
import 'package:vijay_test1/repositories/repo.dart';

import '../screens/dashboard_screen.dart';

class SignInController extends GetxController
{

  final emailorPhone = 'email'.obs;
  final isLoading = false.obs;

  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();


  Repo _repo = Repo();

  void login(BuildContext context) async {
    final isValid = validateEmail(email.text.toString(), context);

    if (!isValid!) {
      return; // ⛔ validation fail → API call stop
    }

    isLoading.value = true;

    try {
      final response = await _repo.login(
        LoginData(
          email: email.text.trim(),
          password: 'cityslicka',
        ),
      );

      isLoading.value = false;
      Get.to(const DashboardScreen());
      print(response.token);

    } on DioException catch (e) {
      isLoading.value = false;
      ErrorSnack.errorSnackBar(
        context,
        e.error?.toString() ?? 'Something went wrong',
      );
    }
  }


  void changeValue() {
    if(emailorPhone.value.toString().toLowerCase() == 'phone')
    {
      emailorPhone.value = 'email';
      email.clear();
      mobile.clear();
    }
    else
    {
      emailorPhone.value = 'phone';
      email.clear();
      mobile.clear();
    }
  }

  bool validateEmail(String? value, BuildContext context) {
    FocusScope.of(context).unfocus();
    if (value == null || value.trim().isEmpty) {
      ErrorSnack.errorSnackBar(context, 'Email is required');
      return false;
    }

    final email = value.trim();

    if (email.contains(' ')) {
      ErrorSnack.errorSnackBar(context, 'Email should not contain spaces');
      return false;
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(email)) {
      ErrorSnack.errorSnackBar(context, 'Enter a valid email address');
      return false;
    }

    if (email.startsWith('.') ||
        email.endsWith('.') ||
        email.contains('..')) {
      ErrorSnack.errorSnackBar(context, 'Enter a valid email address');
      return false;
    }

    return true;
  }
}