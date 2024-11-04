import 'package:flutter/material.dart';
import 'package:login_register_flutter/authFunctions/check_state.dart';
import 'package:login_register_flutter/pages/add_folder.dart';
import 'package:login_register_flutter/pages/home_page.dart';
import 'package:login_register_flutter/pages/login_page.dart';
import 'package:login_register_flutter/pages/register_page.dart';
import 'package:login_register_flutter/pages/reset_pass.dart';
import 'package:login_register_flutter/pages/update_folder.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool? isVerified;

  Future<void> getVerificationState() async {
    isVerified = await CheckState.isUserSignedIn();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVerificationState();
    print("App URL: ${Uri.base}");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      routes: {
        "homePage": (context) => const HomePage(),
        "LoginPage": (context) => const LoginPage(),
        "RegisterPage": (context) => const RegisterPage(),
        "ResetPass": (context) => const ResetPass(),
        "AddFolder": (context) => const AddFolder(),
      },
      initialRoute: isVerified! ? "homePage" : "LoginPage",
    );
  }
}
