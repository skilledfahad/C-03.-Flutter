import 'package:flutter/material.dart';
import 'package:m_12_task_manager_app/data/models/network_response_object.dart';
import 'package:m_12_task_manager_app/data/utils/auth_utils.dart';
import 'package:m_12_task_manager_app/data/services/api_caller.dart';
import 'package:m_12_task_manager_app/data/utils/urls.dart';
import 'package:m_12_task_manager_app/ui/screens/authentication_screens/sign_up_screen.dart';
import 'package:m_12_task_manager_app/ui/utils/validation_utils.dart';
import 'package:m_12_task_manager_app/ui/widget/screen_background.dart';
import '../../../data/models/login_model.dart';
import '../../utils/snack_bar_msg.dart';
import '../main_screens/base_nav_screen.dart';
import 'forgot_password_screens/recover_email_verification_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();

  bool _isLoading =false;

  Future _userLogin() async {
    setState(() {
      _isLoading = true;
    });

    Map<String,dynamic> body={
      "email": _emailController.text.trim(),
      "password": _passwordController.text,
    };
    final NetworkResponse response =await ApiCaller().postRequest(Urls.loginUrl, body,isLogin: true);

    if (mounted){
      if(response.isSuccess){

        LoginModel model = LoginModel.fromJson(response.body!);

        await AuthUtils.savedUserInfo(model);

        _emailController.clear();
        _passwordController.clear();

        if (mounted) {
          SnackBarMsg(context, 'Login Success');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const BaseNavScreen(),),
              (route) => false);
        }
      }
      else{
        SnackBarMsg(context, 'Incorrect Email or Password'); //todo: add specific reason
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  bool _showPassword = false;
  void _seePassword(){
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 120),
                    Text("Get Started With",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Email"
                      ),
                      validator: (String? value) {
                        if(value?.isValidEmail != true){
                          return "Enter a Valid Email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    Stack(
                      children: [
                        TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !_showPassword,
                          decoration: const InputDecoration(
                              hintText: "Password",
                              helperText:"Password must contain number"
                          ),

                          // validator: (String? value) {
                          //   if(value?.isValidPassword != true){
                          //     return "Password Contains latter and number";
                          //   }
                          //   return null;
                          // },

                        ),
                        Positioned(
                            right: 10,
                            child: IconButton.filled(onPressed: () {_seePassword();},
                            icon: _showPassword?
                            const Icon(Icons.lock_open,size: 20):
                            const Icon(Icons.lock,size: 20)))
                      ]
                    ),
                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: !_isLoading,
                        replacement: const Center(child: CircularProgressIndicator()),
                        child: ElevatedButton(onPressed: (){

                          if(_formKey.currentState!.validate()){

                            _userLogin();

                          }
                        },
                            child:const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    Center(
                      child: TextButton(onPressed:(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) =>const RecoverEmailVerificationScreen()));
                        },
                          child: const Text("Forget Password?",
                            style: TextStyle(color: Colors.grey),
                          )),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have Account?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5
                        )),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                        },
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: const Text("Sign up"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}