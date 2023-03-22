import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/screens/tnc/terms_and_conditions.dart';
import 'package:lgbtq_social_media/utils/assets_manager.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';

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
  bool isLogin = false;
  bool isLoading = false;
  bool isTncChecked = false;

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
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Continue",
                        textScaleFactor: 1,
                      ),
                    ),
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
                            onPressed: () {},
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
