import 'package:flutter/material.dart';
import 'package:m_12_task_manager_app/data/utils/auth_utils.dart';
import 'package:m_12_task_manager_app/ui/screens/authentication_screens/login_screen.dart';
import 'package:m_12_task_manager_app/ui/screens/authentication_screens/update_profile_screen.dart';

import '../../widget/profile_banner.dart';
import '../exit_app_confirmation_screen.dart';
import 'cancelled_screen.dart';
import 'complete_screen.dart';
import 'new_task_screen.dart';
import 'in_progress_screen.dart';


class BaseNavScreen extends StatefulWidget {
  const BaseNavScreen({Key? key}) : super(key: key);

  @override
  State<BaseNavScreen> createState() => _BaseNavScreenState();
}

class _BaseNavScreenState extends State<BaseNavScreen> {

  int _currentIndex=0;

  final List<Widget> _bottomNavScreens=[
    const NewTaskScreen(),
    const InProgressScreen(),
    const CancelledTaskScreen(),
    const CompleteTaskScreen()
  ];


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool exitConfirmed = await showExitConfirmationDialog(context);
        return exitConfirmed;
      },
      child: Scaffold(

        appBar: AppBar(
            title: GestureDetector(
                onTap: (){Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const UpdateProfileScreen()));},
                child: const ProfileBanner()),
          actions: [
            IconButton(icon: const Icon(Icons.logout),
              onPressed: () async {
                await AuthUtils.removeUserInfo();
                if(mounted){
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                      (route) => false);
                }
              }
            ),
          ],
        ),
        body: _bottomNavScreens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          currentIndex: _currentIndex,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          selectedItemColor: Colors.green,
          onTap: (int index) {
            if(mounted){
              setState(() {
                _currentIndex=index;
              });
            }
          },
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon:Icon (Icons.file_copy),label: "Home",backgroundColor: Colors.white54),
            BottomNavigationBarItem(icon:Icon (Icons.upload_file_rounded),label: "In Progress"),
            BottomNavigationBarItem(icon:Icon (Icons.dangerous),label: "Cancelled"),
            BottomNavigationBarItem(icon:Icon (Icons.file_download_done),label: "Complete"),
          ],
        ),
      ),
    );
  }
}