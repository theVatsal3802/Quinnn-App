import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/functions/auth_functions.dart';
import 'package:lgbtq_social_media/screens/auth/forgot_password_screen.dart';
import 'package:lgbtq_social_media/screens/auth/profile_setup_screen.dart';
import 'package:lgbtq_social_media/screens/auth/signup_screen.dart';
import 'package:lgbtq_social_media/screens/dashboard/home_screen.dart';
import 'package:lgbtq_social_media/utils/assets_manager.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';
import 'package:lgbtq_social_media/utils/parse_functions.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";
  final bool isFromSignup;
  const LoginScreen({
    super.key,
    required this.isFromSignup,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> login() async {
    FocusScope.of(context).unfocus();
    final valid = _formKey.currentState!.validate();
    if (!valid) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      isLoading = true;
    });
    await AuthFunctions.loginUser(
      email: emailController.text.toLowerCase(),
      password: passwordController.text,
    ).then(
      (value) {
        setState(() {
          isLoading = false;
        });
        if (value.isNotEmpty) {
          if (widget.isFromSignup) {
            Navigator.of(context).pushNamed(
              ProfileSetupScreen.routeName,
              arguments: value,
            );
          } else {
            Navigator.of(context).pushNamedAndRemoveUntil(
              HomeScreen.routeName,
              (route) => false,
              arguments: value,
            );
          }
        } else {
          ParseFunctions.showSnackbar(
            context: context,
            text: value,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.baseWhiteShadeColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Image.asset(
                      AssetManager.appLogo,
                      height: MediaQuery.of(context).size.width * 0.6,
                      width: MediaQuery.of(context).size.width * 0.6,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Welcome to ",
                        textScaleFactor: 1,
                        style: Theme.of(context).textTheme.headlineSmall!,
                      ),
                      Text(
                        AssetManager.appName,
                        textScaleFactor: 1,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: ColorManager.baseBlueColor,
                                ),
                      ),
                    ],
                  ),
                  Text(
                    "Login to continue",
                    textScaleFactor: 1,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ColorManager.baseDarkGreyColor,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (widget.isFromSignup)
                    Text(
                      "Please verify your email and login to continue",
                      textScaleFactor: 1,
                      style: TextStyle(
                        color: Colors.red[800],
                      ),
                    ),
                  if (widget.isFromSignup)
                    const SizedBox(
                      height: 10,
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      key: const ValueKey('email'),
                      controller: emailController,
                      autocorrect: false,
                      enableSuggestions: true,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email Id',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your email Id";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      key: const ValueKey('password'),
                      controller: passwordController,
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: true,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.key),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a password";
                        }
                        return null;
                      },
                    ),
                  ),
                  if (!isLoading)
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          await login();
                        },
                        child: const Text(
                          "Continue",
                          textScaleFactor: 1,
                        ),
                      ),
                    ),
                  if (isLoading)
                    const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "New to ${AssetManager.appName}? ",
                          textScaleFactor: 1,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              SignupScreen.routeName,
                              (route) => false,
                            );
                          },
                          child: const Text(
                            "Signup Now",
                            textScaleFactor: 1,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorManager.baseBlueColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Forgot password?",
                          textScaleFactor: 1,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(ForgotPasswordScreen.routeName);
                          },
                          child: const Text(
                            "Click here to reset",
                            textScaleFactor: 1,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorManager.baseBlueColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
