import 'package:flutter/material.dart';
import 'package:taskz/features/auth/pages/login_page.dart';
import 'package:taskz/utils/constants/colors.dart';
import 'package:taskz/utils/constants/sizes.dart';
import 'package:taskz/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: TColors.secondary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 255),
                Text(
                  "Welcome to Taskz",
                  style: textTheme.displayLarge?.copyWith(
                    color: TColors.accent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Enter your name' : null,
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your email';
                    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                  value == null || value.length < 6
                      ? 'Password must be at least 6 characters'
                      : null,
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: TColors.accent,
                      side: BorderSide(color: Colors.indigo.shade700),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Perform signup logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Signing Up...')),
                        );
                      }
                    },
                    child: const Text("Register"),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    print("Clicked");
                    Get.to(const LoginPage()); // adjust route
                  },
                  child: const Text(
                    "Already have an account? Log in",
                    style: TextStyle(color: TColors.accent),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
