import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData(primarySwatch: Colors.grey),
      color: Colors.white10,
      home: const MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  MySnackBar(message,context){
    return ScaffoldMessenger.of (context).showSnackBar(
      SnackBar(content: Text(message),duration: const Duration(milliseconds: 500),)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){},icon: const Icon(Icons.logo_dev)),
        title: const Text("Demo_App"),
        backgroundColor: Colors.blue[700],
        titleSpacing: 0,
        elevation: 8,
        centerTitle: false,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        actions: [IconButton(onPressed: () {MySnackBar("Notifications",context);}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {MySnackBar("Call us",context);}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {MySnackBar("Profile",context);}, icon: const Icon(Icons.account_circle)),
        ]),


      floatingActionButton: FloatingActionButton(
        elevation: 8,
        onPressed:(){MySnackBar("Massage",context);},
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.message),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex : 0,
        iconSize : 24,
        backgroundColor : Colors.white60,
        fixedColor : Colors.blueGrey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.schedule),label: "Schedule" ),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book),label: "Library"),
          // BottomNavigationBarItem(icon: Icon(Icons.menu_book_sharp),label: "Library") //Why 4th icon cause problem??
        ],
        onTap: (int index){
          if (index==0){MySnackBar("Home",context);}
          if (index==1){MySnackBar("Schedule",context);}
          if (index==2){MySnackBar("Library",context);}
        },
      ),

      drawer: Drawer(
        child: ListView(
          children:[
            DrawerHeader(
              padding: EdgeInsets.all(2),
                child: UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      image: DecorationImage(
                        image: NetworkImage('https://www.digiedupro.com/media/2020/07/Beijing_Institute_of_Graphic_Communication_Slider_4.jpg'),
                        fit: BoxFit.cover,
                  )
                  ),
                  accountName: Text("Beijing Institute of Graphic Communication",style: TextStyle(backgroundColor: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14)),
                  accountEmail: Text("fahad.bigc@gmail.com",style: TextStyle(fontSize: 10,backgroundColor: Colors.black38)),
                  currentAccountPicture: Image.network("https://lh3.googleusercontent.com/p/AF1QipN6O9nyN-k9DZjyqwYCllByMaTTrK-u8yO_1pCb=s680-w680-h510"),
                )
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: (){MySnackBar("_button",context);},
              selected: true,),
            ListTile(leading: Icon(Icons.notifications),title: Text("Notifications"),onTap: (){MySnackBar("_button",context);}),
            ListTile(leading: Icon(Icons.schedule),title: Text("Schedule"),onTap: (){MySnackBar("_button",context);}),
            ListTile(leading: Icon(Icons.menu_book),title: Text("Library"),onTap: (){MySnackBar("_button",context);},enabled: false,
            trailing: Text("Under work"),),
            ListTile(leading: Icon(Icons.payment),title: Text("Payment"))

          ]
        )
      ),


      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(2),
              child: UserAccountsDrawerHeader(
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue,
                    image: DecorationImage(
                      image: NetworkImage("https://media-exp1.licdn.com/dms/image/C4E16AQGWmAXE_JNttA/profile-displaybackgroundimage-shrink_200_800/0/1625588202764?e=2147483647&v=beta&t=8xtv2NKc68DV_yg_oU66u9RBJegFv06so9nygVr64r4"),
                      fit: BoxFit.contain,)),
                accountName: Text("Fahad Hossen"),
                accountEmail: Text("fahad.itwork@gmail.com"),
                currentAccountPicture: Image.network("https://media-exp1.licdn.com/dms/image/C4E03AQGLFk_YzoDIbw/profile-displayphoto-shrink_800_800/0/1625588148899?e=2147483647&v=beta&t=CI1Mv9_vaWHN7xcOvDk1nxTYZkgBMtmh2ycBFKeYih0")
              )
            ),

            ListTile(leading: Icon(Icons.person),title: Text("ID : 2021BE020")),
            ListTile(leading: Icon(Icons.newspaper),title: Text("Results"),onTap: (){MySnackBar("_button",context);}),
            ListTile(leading: Icon(Icons.drive_file_move),title: Text("Assignment"),onTap: (){MySnackBar("_button",context);}),
          ]
        ),
      ),
    );
  }
}


