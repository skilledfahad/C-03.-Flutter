import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:m_12_task_manager_app/data/utils/auth_utils.dart';
import 'package:m_12_task_manager_app/ui/screens/authentication_screens/login_screen.dart';
import 'package:m_12_task_manager_app/ui/utils/assets_utils.dart';
import '../widget/screen_background.dart';
import 'main_screens/base_nav_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  void navigateToLogin(){
      Future.delayed(const Duration(seconds: 3)).then((_) async {
        bool isLoggedIn= await AuthUtils.isUserLoggedIn();
        if (mounted) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => isLoggedIn?
            const BaseNavScreen():
            const LoginScreen()),
            (route) => false);}
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SvgPicture.asset(AssetsUtils.logoSVG,
              fit: BoxFit.scaleDown,
              width: 90,
            )
        ),
      )
    );
  }
}