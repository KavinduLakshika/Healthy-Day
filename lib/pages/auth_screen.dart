import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthy_day_mobile/app_colors.dart';
import 'package:healthy_day_mobile/components/custom_text_field.dart';
import 'package:healthy_day_mobile/components/primary_button.dart';
import 'package:healthy_day_mobile/components/icon_button.dart';
import 'package:healthy_day_mobile/pages/dashboard.dart';
import 'package:healthy_day_mobile/pages/forgot_password_screen.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.onAuth});
  final VoidCallback onAuth;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  bool showPassword = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void handleSubmit() {
    if (isLogin) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Dashboard()),
      );
    } else {
      debugPrint("Sign Up: ${emailController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.healthyLightBlue,
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.healthyLightBlue,
                  AppColors.healthyLightPurple,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: AppColors.healthyBlue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text("💊", style: TextStyle(fontSize: 28)),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  isLogin ? "Welcome Back" : "Join Healthy Day",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.healthyDarkBlue,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  isLogin
                      ? "Sign in to continue your health journey"
                      : "Create your account to get started",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.healthyDarkBlue,
                  ),
                ),
              ],
            ),
          ),

          // Form Card
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                      label: "Email",
                      placeholder: "Enter your email",
                      controller: emailController,
                      prefixIcon: const Icon(
                        LucideIcons.mail,
                        color: AppColors.healthyDarkBlue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: "Password",
                      placeholder: "Enter your password",
                      controller: passwordController,
                      isPassword: !showPassword,
                      prefixIcon: const Icon(
                        LucideIcons.lock,
                        color: AppColors.healthyDarkBlue,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => showPassword = !showPassword),
                        icon: Icon(
                          showPassword ? LucideIcons.eyeOff : LucideIcons.eye,
                          color: AppColors.healthyDarkBlue,
                        ),
                      ),
                    ),
                    if (isLogin)
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen(
                                  onBack: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            "Forgot password?",
                            style: TextStyle(color: AppColors.healthyBlue),
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      text: isLogin ? "Sign In" : "Create Account",
                      onPressed: handleSubmit,
                      width: double.infinity,
                      color: AppColors.healthyBlue,
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 28),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 12),
                    const Text(
                      "Or continue with",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(height: 16),
                    IconWithButton(
                      text: "Continue with Google",
                      iconWidget: SvgPicture.asset(
                        'assets/icons/google.svg',
                        height: 22,
                        width: 22,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 12),
                    IconWithButton(
                      text: "Continue with Apple",
                      iconWidget: SvgPicture.asset(
                        'assets/icons/apple.svg',
                        height: 22,
                        width: 22,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isLogin
                              ? "Don't have an account? "
                              : "Already have an account? ",
                          style: const TextStyle(fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => isLogin = !isLogin),
                          child: Text(
                            isLogin ? "Sign up" : "Sign in",
                            style: TextStyle(
                              color: AppColors.healthyBlue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
