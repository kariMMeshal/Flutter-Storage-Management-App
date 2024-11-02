import 'package:flutter/material.dart';
import 'package:login_register_flutter/Auth_sharedwidgets/custom_buttonauth.dart';
import 'package:login_register_flutter/Auth_sharedwidgets/custom_textfield.dart';
import 'package:login_register_flutter/Auth_sharedwidgets/login_logo.dart';
import 'package:login_register_flutter/authFunctions/create_account.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Center(child: LoginLogo()),
            const SizedBox(height: 20),
            const Column(
              children: [
                Text("Register",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Text("Create a new account \n"),
              ],
            ),
            Form(
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(" Name",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  CustomTextfield(
                    hint: "Enter Your Name",
                    myController: name,
                  ),
                  const Text(" Mail",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  CustomTextfield(
                    hint: "Enter Your Email",
                    myController: mail,
                  ),
                  const Text(" Password",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  CustomTextfield(
                    hint: "Enter Your Password",
                    myController: password,
                  ),
                  const Text(" Confirm Password",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  CustomTextfield(
                    hint: " Enter Your Pass Again",
                    myController: password,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButtonauth(
                    iconPath: "assets/images/login.png",
                    title: "Login ",
                    onPressed: () {
                      if (formState.currentState!.validate()) {
                        CreateAccount.createAccount(
                          context,
                          emailAddress: mail.text.trim(),
                          password: password.text.trim(),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
