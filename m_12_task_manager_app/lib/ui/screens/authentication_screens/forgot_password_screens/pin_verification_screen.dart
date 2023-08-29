import 'package:flutter/material.dart';
import 'package:m_12_task_manager_app/data/models/network_response_object.dart';
import 'package:m_12_task_manager_app/data/services/api_caller.dart';
import 'package:m_12_task_manager_app/ui/utils/snack_bar_msg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../data/utils/urls.dart';
import '../../../widget/screen_background.dart';
import 'password_reset_screen.dart';
import '../login_screen.dart';

class PinVerification extends StatefulWidget {
  final String userEmail;
  const PinVerification({Key? key,required this.userEmail}) : super(key: key);

  @override
  State<PinVerification> createState() => _PinVerificationState();
}

class _PinVerificationState extends State<PinVerification> {

  late String otp;

  bool _isLoading=false;

  Future<void> _verifyOTP() async {

    setState(() {
      _isLoading=true;
    });

    NetworkResponse response = await ApiCaller().getRequest(Urls.otpVerification(widget.userEmail,otp));
    if(response.isSuccess){
     if (mounted) {
       Navigator.pushAndRemoveUntil(context,
           MaterialPageRoute(builder: (context) =>
               PasswordReset(otp: otp, userEmail: widget.userEmail,)), (route) => false);
     }
    }
    else{
      if(mounted)
      {SnackBarMsg(context,"Request failed! Check your email.");}
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
                  Text("PIN Verification",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge,
                  ),
                  const Text(
                    "A 6 digit verification will be send to your email",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    widget.userEmail,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),

                  //--------- Pin Field start--------
                  PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      inactiveFillColor: Colors.white,
                      //step 1 box inside color
                      selectedFillColor: Colors.white,
                      //step 2 box inside color
                      activeFillColor: Colors.white,
                      //step 3 filled inside box color
                      inactiveColor: Colors.white,
                      //step 1 box border color
                      selectedColor: Colors.white,
                      //step 2 box border color
                      activeColor: Colors.white, //step 3 box border color
                    ),
                    enablePinAutofill: true,
                    backgroundColor: Colors.transparent,
                    cursorColor: Colors.green,

                    animationDuration: const Duration(milliseconds: 300),

                    enableActiveFill: true,

                    onCompleted: (value) {
                      otp = value;
                    },

                    onChanged: (value) {
                      setState(() {
                        //
                      });
                    },
                    beforeTextPaste: (text) {
                      return false;
                    },
                    appContext: context,
                  ),
                  //--------- Pin Field end--------
                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: !_isLoading,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(onPressed: () {
                        _verifyOTP();
                      },
                        child: const Text("Verify"),
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
                      TextButton(onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
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
          )),
      );
    }
  }
