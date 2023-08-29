import 'package:flutter/material.dart';
import 'package:m_12_task_manager_app/data/services/api_caller.dart';
import 'package:m_12_task_manager_app/ui/screens/authentication_screens/forgot_password_screens/pin_verification_screen.dart';
import 'package:m_12_task_manager_app/ui/utils/validation_utils.dart';
import '../../../../data/models/network_response_object.dart';
import '../../../../data/utils/urls.dart';
import '../../../utils/snack_bar_msg.dart';
import '../../../widget/screen_background.dart';


class RecoverEmailVerificationScreen extends StatefulWidget {
  const RecoverEmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<RecoverEmailVerificationScreen> createState() => _RecoverEmailVerificationScreenState();
}

class _RecoverEmailVerificationScreenState extends State<RecoverEmailVerificationScreen> {

  final TextEditingController _emailController = TextEditingController();

  late final String userEmail;

  bool _isLoading=false;

  Future<void> _verifyEmail() async {
    setState(() {
      _isLoading=true;
    });

    NetworkResponse response= await ApiCaller().getRequest(Urls.verifyEmail(userEmail));
    if(response.isSuccess){
      if (mounted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>
            PinVerification(userEmail: userEmail)));
        SnackBarMsg(context,"Check your Email for OTP");
        _emailController.clear();
      }
    }else{
      if(mounted){
        SnackBarMsg(context, "Error: ${response.statusCode}");
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 120),
                  Text("Your Email Address",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Text("A 6 digit verification will be send to your email",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller:_emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: "Email"
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
                      child: ElevatedButton(
                        onPressed: (){
                          userEmail=_emailController.text.trim();
                        if(userEmail.isValidEmail) {
                        _verifyEmail();

                      }else{
                          SnackBarMsg(
                            context,
                              "Enter a valid mail");
                        }
                  },
                        child:const Icon(Icons.arrow_forward_ios),
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
                        Navigator.pop(context);
                      },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: const Text("Sign in"),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}