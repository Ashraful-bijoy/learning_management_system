import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_management_system/presentation/ui/screens/auth/sign_up_screen.dart';
import 'package:learning_management_system/presentation/ui/utils/app_colors.dart';
import 'package:learning_management_system/presentation/ui/utils/assets_path.dart';
import 'package:lottie/lottie.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 25, 25, 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: Text(
                    'Welcome Back!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Center(
                  child: Text(
                    'Login to your account and enjoy learning...',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Center(
                  child: Lottie.asset(
                    AssetsPath.logInAnimation,
                    height: 280,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Email',
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  obscureText: _showPassword == false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter a valid password';
                    }
                    return null;
                  },
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        _showPassword = !_showPassword;
                        if (mounted) {
                          setState(() {});
                        }
                      },
                      icon: Icon(_showPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:
                          'By using our services, you are agreeing to our Terms & policies.',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildForgotPasswordAndSignUpSection()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordAndSignUpSection() {
    return Column(
      children: [
        Center(
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        RichText(
          text: TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              letterSpacing: 0.4,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            children: [
              TextSpan(
                text: 'Sign Up',
                style: const TextStyle(
                    color: AppColors.themeColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                recognizer: TapGestureRecognizer()..onTap = _onTapSignUpButton,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onTapSignUpButton() {
    Get.to(
      () => const SignUpScreen(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
