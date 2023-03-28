import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/functions/auth_functions.dart';
import 'package:lgbtq_social_media/screens/auth/login_screen.dart';
import 'package:lgbtq_social_media/screens/tnc/terms_and_conditions.dart';
import 'package:lgbtq_social_media/utils/assets_manager.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';
import 'package:lgbtq_social_media/utils/parse_functions.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = "/auth";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const LoginScreen(isFromSignup: true);
              },
            ),
          );
        } else {
          ParseFunctions.showSnackbar(
            context: context,
            text: "Sign up failed, please try again",
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
                    "Sign up to continue",
                    textScaleFactor: 1,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ColorManager.baseDarkGreyColor,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                          await signup();
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
                          "Already a member? ",
                          textScaleFactor: 1,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const LoginScreen(isFromSignup: false);
                                },
                              ),
                              (route) => false,
                            );
                          },
                          child: const Text(
                            "Login Instead",
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
