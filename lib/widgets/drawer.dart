import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    const ImageURL = "https://play-lh.googleusercontent.com/LeX880ebGwSM8Ai_zukSE83vLsyUEUePcPVsMJr2p8H3TUYwNg-2J_dVMdaVhfv1cHg";

    return Drawer(
      child: Container(
        color: Colors.deepPurpleAccent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountEmail: Text("madhavkumar@gmail.com", style: TextStyle(color: Colors.white),),
                  accountName: Text("MadhavKumar-WK", style: TextStyle(color: Colors.white),),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(ImageURL),),
                )

            ),

            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white,),
              title: Text("Home", style: TextStyle(color: Colors.white),textScaler: TextScaler.linear(1.2),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white,),
              title: Text("Profile", style: TextStyle(color: Colors.white),textScaler: TextScaler.linear(1.2),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.settings_solid, color: Colors.white,),
              title: Text("Settings", style: TextStyle(color: Colors.white),textScaler: TextScaler.linear(1.2),),
            ),
          ],
        ),
      )
    );
  }
}
