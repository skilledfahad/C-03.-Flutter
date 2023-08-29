import 'package:flutter/material.dart';
import 'package:m_12_task_manager_app/data/models/login_model.dart';
import 'package:m_12_task_manager_app/data/models/network_response_object.dart';
import 'package:m_12_task_manager_app/data/services/api_caller.dart';
import 'package:m_12_task_manager_app/ui/widget/screen_background.dart';

import '../../../data/utils/auth_utils.dart';
import '../../../data/utils/urls.dart';
import '../../utils/snack_bar_msg.dart';
import '../../widget/profile_banner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m_12_task_manager_app/ui/utils/validation_utils.dart';


class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  UserData userData= AuthUtils.userInfo.data!;

  final GlobalKey<FormState> _profileUpdateFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController(
      text: AuthUtils.userInfo.data!.email
  );
  final TextEditingController _firstNameController = TextEditingController(
      text: AuthUtils.userInfo.data!.firstName
  );
  final TextEditingController _lastNameController = TextEditingController(
      text: AuthUtils.userInfo.data!.lastName
  );
  final TextEditingController _phoneNumberController = TextEditingController(text: AuthUtils.userInfo.data!.mobile);
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  XFile? imgFile;

  Future <void> _updateProfile() async {
    setState(() {
      _isLoading=true;
    });
    final Map<String,dynamic> body={
      "firstName": _firstNameController.text.trim(),
      "lastName": _lastNameController.text.trim(),
      "mobile": _phoneNumberController.text.trim(),
      "photo": "",
    };
    if(_passwordController.text.isNotEmpty){
      body["password"] = _passwordController.text;
    }
    final NetworkResponse response=await ApiCaller().postRequest(Urls.updateProfile, body);
    if (mounted){

      if(response.isSuccess){
        userData.firstName = _firstNameController.text.trim();
        userData.lastName = _lastNameController.text.trim();
        userData.mobile = _phoneNumberController.text.trim();
        AuthUtils.updateUserInfo(userData);
        _passwordController.clear();
        SnackBarMsg(context, 'Profile Update');
      }
      else{
        SnackBarMsg(context, 'Profile Update Failed');
      }
    }
    setState(() {
      _isLoading =false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const ProfileBanner(),
          actions: [
            IconButton(
                onPressed: (){Navigator.pop(context);},
              icon: const Icon(Icons.arrow_forward_ios_sharp))],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _profileUpdateFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Text("Update Profile",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: InkWell(
                      onTap: (){
                        getPhoto();
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 24,right: 15),
                            alignment: Alignment.center,
                            height: 45,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5)
                              ),
                              color: Colors.black54,
                            ),
                            child: const Text("Photo",style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold
                            )),
                          ),
                          const SizedBox(width: 12),
                          Flexible(
                            child: Visibility(
                                visible: imgFile !=null,
                                child: Text(imgFile?.name?? "",
                                overflow: TextOverflow.ellipsis,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  TextFormField(
                    readOnly: true,
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
                    validator: (String? value) {
                      if(value?.isValidName != true){
                        return "Enter a Valid name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _lastNameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        hintText: "Last Name"
                    ),
                    validator: (String? value) {
                      if(value?.isValidName != true){
                        return "Enter a Valid name";
                      }
                      return null;
                    },
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
                          if(_profileUpdateFormKey.currentState!.validate()){
                            _updateProfile();
                          }
                        },
                        child:const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getPhoto(){
    ImagePicker picker = ImagePicker();
    picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        imgFile = xFile;
        if(mounted){
          setState(() {});
        }
      }
    }
    );
  }

}