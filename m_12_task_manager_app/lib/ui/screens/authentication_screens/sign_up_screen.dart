import 'package:flutter/material.dart';
import 'package:m_12_task_manager_app/data/models/network_response_object.dart';
import 'package:m_12_task_manager_app/data/services/api_caller.dart';
import 'package:m_12_task_manager_app/data/utils/urls.dart';
import 'package:m_12_task_manager_app/ui/screens/authentication_screens/login_screen.dart';
import 'package:m_12_task_manager_app/ui/utils/snack_bar_msg.dart';
import 'package:m_12_task_manager_app/ui/utils/validation_utils.dart';

import '../../widget/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  Future userSignUp() async {
   setState(() {
     _isLoading = true;
   });

    Map<String,dynamic> body={
    "email": _emailController.text.trim(),
    "firstName": _firstNameController.text.trim(),
    "lastName": _lastNameController.text.trim(),
    "mobile": _phoneNumberController.text.trim(),
    "password": _passwordController.text,
    "photo": "",
  };

    final NetworkResponse response = await ApiCaller().postRequest(Urls.regUrl,body);

    if (mounted){
      if(response.isSuccess){

        _emailController.clear();
        _firstNameController.clear();
        _lastNameController.clear();
        _phoneNumberController.clear();
        _passwordController.clear();

        SnackBarMsg(context, 'Registration Success! Login Please');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false);
      }
      else{
        SnackBarMsg(context, 'Registration Fails'); //todo: add error code
      }
    }
   setState(() {
     _isLoading = false;
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
                    const SizedBox(height: 60),
                    Text("Join With Us",
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
                          return "Enter a Valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _firstNameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          hintText: "First Name"
                      ),
                      // validator: (String? value) {
                      //   if(value?.isValidName != true){
                      //     return "Enter a Valid name";
                      //   }
                      //   return null;
                      // },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _lastNameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          hintText: "Last Name"
                      ),
                      // validator: (String? value) {
                      //   if(value?.isValidName != true){
                      //     return "Enter a Valid name";
                      //   }
                      //   return null;
                      // },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          hintText: "Phone Number"
                      ),
                      // validator: (String? value) {
                      //   if(value?.isValidPhone != true){
                      //     return "Enter 11 digit phone number";
                      //   }
                      //   return null;
                      // },
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                            hintText: "Password"
                        ),
                        // validator: (String? value){
                        //   if (value?.isValidPassword != true){
                        //     return "Password Must include latter and number";
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: !_isLoading,
                        replacement: const Center(child: CircularProgressIndicator()),
                        child: ElevatedButton(
                          onPressed: (){
                          if(_formKey.currentState!.validate()){
                            userSignUp();
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
                        const Text("Have account?",
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
            ),
          )),
    );
  }
}