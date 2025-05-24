import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskz/features/auth/pages/signup_page.dart';
import 'package:taskz/features/home/dashboard.dart';
import 'package:taskz/utils/constants/colors.dart';
import 'package:taskz/utils/constants/sizes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    setState(() => isLoading = true);

    Future.delayed(const Duration(seconds: 1), () {
      setState(() => isLoading = false);

      // Navigate to Dashboard
      Get.to(() => const Dashboard());
    });
  }


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: TColors.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 120),
                Text(
                  "Login to Taskz",
                  style: textTheme.displayLarge?.copyWith(
                    color: TColors.accent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections * 2),
                SizedBox(
                  height: 65,
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                SizedBox(
                  height: 65,
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Navigate to forgot password page
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: TColors.accent),
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.accent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Login", style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                TextButton(
                  onPressed: () {
                    Get.to(() => const SignupPage());
                  },
                  child: const Text(
                    "Don’t have an account? Sign up",
                    style: TextStyle(color: TColors.accent),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
