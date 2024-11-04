import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_register_flutter/Auth_sharedwidgets/custom_buttonauth.dart';
import 'package:login_register_flutter/Auth_sharedwidgets/custom_dialog.dart';
import 'package:login_register_flutter/Auth_sharedwidgets/custom_textfield.dart';
import 'package:login_register_flutter/authFunctions/facebook_login.dart';
import 'package:login_register_flutter/Auth_sharedwidgets/login_logo.dart';
import 'package:login_register_flutter/authFunctions/check_state.dart';
import 'package:login_register_flutter/authFunctions/google_login.dart';
import 'package:login_register_flutter/authFunctions/user_sign_in.dart';
import 'package:login_register_flutter/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CheckState.getState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  const SizedBox(height: 30),
                  const Center(
                    child: LoginLogo(),
                  ),
                  const SizedBox(height: 20),
                  const Column(
                    children: [
                      Text("Login",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      Text("Login to continue using app\n",
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Form(
                    key: formState,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          " Email",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        CustomTextfield(
                          hint: "Enter Your Mail",
                          myController: email,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          " Password",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        CustomTextfield(
                          isHidden: true,
                          hint: "Enter Your Pass",
                          myController: password,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            Navigator.pushNamed(context, "ResetPass");
                          },
                          child: Container(
                            padding:
                                const EdgeInsets.only(left: 220, bottom: 20),
                            child: const Text(
                              "Forgot Password ? ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            ),
                          ),
                        ),
                        CustomButtonauth(
                          iconPath: "assets/images/login.png",
                          title: "Login",
                          onPressed: () async {
                            _isLoading = true;
                            setState(() {});
                            if (formState.currentState!.validate()) {
                              UserSignIn.signIn(
                                context,
                                emailAddress: email.text.trim(),
                                password: password.text.trim(),
                              );
                              _isLoading = false;
                              setState(() {});
                            } else {
                              _isLoading = false;
                              setState(() {});
                              CustomDialog(
                                context: context,
                                message: "Please check your email",
                                title: "Not Valid",
                                dialogType: DialogType.error,
                              ).customDialog();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButtonauth(
                          iconPath: "assets/images/google.png",
                          title: "Login With Google ",
                          onPressed: () {
                            GoogleLogin.signInWithGoogle(context);
                          },
                          myColor: Colors.red[700],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButtonauth(
                          iconPath: "assets/images/facebook.png",
                          title: "Login With FaceBook  ",
                          onPressed: () {
                            FacebookLogin.signInWithFacebook(context);
                          },
                          myColor: const Color.fromARGB(255, 0, 69, 126),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ));
                    },
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't Have an account ? ",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextSpan(
                            text: "Register",
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
