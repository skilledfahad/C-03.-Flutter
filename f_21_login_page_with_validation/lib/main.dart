import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isThemelight = true;

  void _toggleTheme() {
    setState(() {
      _isThemelight = !_isThemelight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _isThemelight ? ThemeMode.light : ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
          actions: [
            IconButton(
              onPressed: _toggleTheme,
              icon: _isThemelight ? const Icon(Icons.sunny) : const Icon(Icons.dark_mode),
            ),
          ],
        ),
        body: const LoginForm(),
      ),
    );
  }
}



class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  List login_data =[];

  String email='';
  String password='';

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  save_loginData() {

    login_data.add(
        {"email":_emailController.text.trim(), "password":_passController.text.trim()});

    if(mounted){setState(() {});};

    _emailController.clear();
    _passController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _emailController,
                validator: (String? value){
                  if(value?.isValidEmail != true){
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value){
                  email=value!;
                },
                decoration: _fild_deco("Email"),
              ),
            ),
            const SizedBox(height: 15),

            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _passController,
                validator: (value) {
                  if(value?.isValidPassword != true) {
                    return
                      'Please input at least 8 characters including uppercase,lowercase, number and !@#\\><*~';
                  }
                  return null;
                },
                onSaved: (value){
                  password=value!;
                },
                decoration: _fild_deco("Password"),
              ),
            ),
            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();//readyMade Single save with onSaved:
                  save_loginData(); //custom list save
                  print(login_data);
                }
              },
              child: const Text("LogIn"),
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration _fild_deco(label){
  return InputDecoration(
      border: const OutlineInputBorder(),
      labelText: label);
}

extension extString on String {

  bool get isValidName{
    final nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return this?.isNotNull == true && emailRegExp.hasMatch(this!);
  }

  bool get isValidPassword{
    final passwordRegExp =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}');
    return this?.isNotNull == true && passwordRegExp.hasMatch(this!);
  }

  bool get isNotNull{
    return this != null;
  }

  bool get isValidPhone{
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}