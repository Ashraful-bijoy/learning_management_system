import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_management_system/presentation/ui/screens/auth/log_in_screen.dart';
import 'package:learning_management_system/presentation/ui/screens/instructor/instructor_home_screen.dart';
import 'package:learning_management_system/presentation/ui/screens/student/student_home_screen.dart';
import 'package:learning_management_system/presentation/ui/utils/app_colors.dart';
import 'package:learning_management_system/presentation/ui/utils/assets_path.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _retypePasswordController =
      TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int selectedAccountType = 0;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 28,
                ),
                Text(
                  'Create an Account',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Join us now and start learning and teaching',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Center(
                  child: Lottie.asset(
                    AssetsPath.signUpAnimation,
                    height: 150,
                    width: 300,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(
                    'Account Type',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(child: _buildAccountTypeButtonSection(context)),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter a valid Number';
                    }
                    return null;
                  },
                  controller: _numberController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Number',
                  ),
                ),
                const SizedBox(
                  height: 14,
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
                  height: 14,
                ),
                TextFormField(
                  obscureText: _showPassword == false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter a valid retyped password';
                    }
                    return null;
                  },
                  controller: _retypePasswordController,
                  decoration: InputDecoration(
                    hintText: 'Retype Your Password',
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
                  onPressed: () {
                    _onTapCreateAnAccountButton();
                  },
                  child: const Text(
                    'Create an Account',
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
                _buildLogInSection()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountTypeButtonSection(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(8),
      isSelected: [
        selectedAccountType == 0,
        selectedAccountType == 1,
      ],
      onPressed: (index) {
        setState(
          () {
            selectedAccountType = index;
          },
        );
      },
      fillColor: AppColors.themeColor,
      selectedColor: Colors.white,
      color: Colors.black,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Student',
            style: TextStyle(
              fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: selectedAccountType == 0 ? Colors.white : Colors.black,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Instructor',
            style: TextStyle(
              fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: selectedAccountType == 1 ? Colors.white : Colors.black,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogInSection() {
    return Center(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: "Have an account? ",
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                letterSpacing: 0.4,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
              children: [
                TextSpan(
                  text: 'Log In',
                  style: const TextStyle(
                      color: AppColors.themeColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  recognizer: TapGestureRecognizer()..onTap = _onTapLogInButton,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onTapLogInButton() {
    Get.offUntil(MaterialPageRoute(builder: (context) => const LogInScreen()),
        (route) => false);
  }

  void _onTapCreateAnAccountButton() {
    if (_formKey.currentState!.validate()) {
      if (selectedAccountType == 0) {
        Get.to(() => const StudentHomeScreen());
      } else {
        Get.to(() => const InstructorHomeScreen());
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();
    super.dispose();
  }
}
