import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/functions/auth_functions.dart';
import 'package:lgbtq_social_media/screens/auth/email_confirm_screen.dart';
import 'package:lgbtq_social_media/screens/auth/forgot_password_screen.dart';
import 'package:lgbtq_social_media/screens/dashboard/home_screen.dart';
import 'package:lgbtq_social_media/screens/tnc/terms_and_conditions.dart';
import 'package:lgbtq_social_media/utils/assets_manager.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';
import 'package:lgbtq_social_media/utils/parse_functions.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = "/auth";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLogin = true;
  bool isLoading = false;
  bool isTncChecked = false;
  String? selectedGender;
  List<String> genders = [
    "Male",
    "Female",
    "Gay",
    "Lesbian",
    "Bisexual",
    "Transgender",
    "Queer",
    "Prefer not to say"
  ];

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item,
        textScaleFactor: 1,
      ),
    );
  }

  Future<void> signup() async {
    FocusScope.of(context).unfocus();
    final valid = _formKey.currentState!.validate();
    if (!valid) {
      return;
    }
    if (!isTncChecked) {
      ParseFunctions.showSnackbar(
        context: context,
        text: "Please agree to our terms and conditions",
      );
      return;
    }
    if (selectedGender == null || selectedGender!.isEmpty) {
      ParseFunctions.showSnackbar(
        context: context,
        text: "Please specify your gender",
      );
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      isLoading = true;
    });
    await AuthFunctions.signupNewUser(
      name: nameController.text.trim(),
      username: usernameController.text.trim(),
      email: emailController.text.trim().toLowerCase(),
      password: passwordController.text.trim(),
      gender: selectedGender!,
    ).then(
      (value) {
        setState(() {
          isLoading = false;
        });
        if (value) {
          Navigator.of(context).pushNamed(EmailVerificationScreen.routeName);
        } else {
          ParseFunctions.showSnackbar(
            context: context,
            text: "Sign up failed, please try again",
          );
        }
      },
    );
  }

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
          Navigator.of(context).pushNamed(
            HomeScreen.routeName,
            arguments: value,
          );
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
                    isLogin ? "Login to continue" : "Sign up to continue",
                    textScaleFactor: 1,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ColorManager.baseDarkGreyColor,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (!isLogin)
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        key: const ValueKey('name'),
                        controller: nameController,
                        autocorrect: true,
                        textCapitalization: TextCapitalization.words,
                        enableSuggestions: true,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),
                    ),
                  if (!isLogin)
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        key: const ValueKey('username'),
                        controller: usernameController,
                        autocorrect: true,
                        enableSuggestions: true,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          prefixIcon: Icon(Icons.account_circle),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter a username";
                          }
                          return null;
                        },
                      ),
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
                  if (!isLogin)
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: ColorManager.baseGreyColor,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: const Text(
                            "Select Gender",
                            textScaleFactor: 1,
                          ),
                          value: selectedGender,
                          items: genders
                              .map(
                                buildMenuItem,
                              )
                              .toList(),
                          onChanged: (gender) {
                            setState(() {
                              selectedGender = gender;
                            });
                          },
                        ),
                      ),
                    ),
                  if (!isLogin)
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CheckboxListTile(
                        activeColor: ColorManager.baseBlueColor,
                        tileColor: ColorManager.baseGreyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        value: isTncChecked,
                        onChanged: (value) {
                          setState(() {
                            isTncChecked = value!;
                          });
                        },
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "By Clicking here, you agree to",
                              textScaleFactor: 1,
                              softWrap: true,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  TermsAndConditionsScrren.routeName,
                                  arguments: false,
                                );
                              },
                              child: const Text(
                                "Our Terms and Conditions",
                                textScaleFactor: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (!isLoading)
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!isLogin) {
                            await signup();
                          } else {
                            await login();
                          }
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
                        Text(
                          isLogin
                              ? "New to ${AssetManager.appName}? "
                              : "Already a member? ",
                          textScaleFactor: 1,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isLogin = !isLogin;
                            });
                          },
                          child: Text(
                            isLogin ? "Sign up Instead" : "Login Instead",
                            textScaleFactor: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorManager.baseBlueColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isLogin)
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
