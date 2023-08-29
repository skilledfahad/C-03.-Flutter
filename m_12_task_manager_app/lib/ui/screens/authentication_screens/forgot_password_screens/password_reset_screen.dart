import 'package:flutter/material.dart';
import 'package:m_12_task_manager_app/data/models/network_response_object.dart';
import 'package:m_12_task_manager_app/data/services/api_caller.dart';
import 'package:m_12_task_manager_app/ui/utils/snack_bar_msg.dart';
import 'package:m_12_task_manager_app/ui/utils/validation_utils.dart';
import '../../../../data/utils/urls.dart';
import '../../../widget/screen_background.dart';
import '../../main_screens/base_nav_screen.dart';
import '../login_screen.dart';

class PasswordReset extends StatefulWidget {
  final String otp;
  final String userEmail;
  const PasswordReset({Key? key, required this.otp, required this.userEmail}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {

  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _confirmPassController=TextEditingController();
  
  bool _isLoading =false;

  Future<void> _passwordReset()async {
    setState(() {
      _isLoading=true;
    });

    Map<String,dynamic> body={
      "email":widget.userEmail,
      "OTP":widget.otp,
      "password": _confirmPassController.text
    };
    
    NetworkResponse response=await ApiCaller().postRequest(Urls.recoverResetPass, body);
    if(response.isSuccess){
      if (mounted) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => const BaseNavScreen()),
            (route) => false);
        SnackBarMsg(context, "Password Reset Successful");
        _passwordController.clear();
        _confirmPassController.clear();
      }else{
        SnackBarMsg(context,'Error: ${response.statusCode}');
      }
    }
    
    setState(() {
      _isLoading=false;
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
                    Text("Set Password",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Text("Minimum length password 8 character with letter and number combination",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "New Password"
                      ),
                      validator: (value){
                        if(value?.isValidPassword != true){
                          return 'Password must contain number';
                        }
                        return null;
                      }
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: TextFormField(
                        controller: _confirmPassController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                            hintText: "Confirm Password"
                        ),
                        validator: (String? value) {
                          if(value!.isEmpty || value != _passwordController.text){
                            return "Wrong confirmation Password";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: !_isLoading,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(onPressed: (){
                          if (_formKey.currentState!.validate()) {
                            _passwordReset();
                          }
                        },
                          child:const Text("Confirm"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Have an account?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5
                            )),
                        TextButton(onPressed: (){
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                              (route) => false);
                        },

                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: const Text("Sign in"),
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