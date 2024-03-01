import 'package:flutter/material.dart';
import 'package:projet/appli/profil/action.dart';
import 'package:projet/appli/profil/editprofil.dart';
import 'package:projet/appli/profil/management.dart';
import 'package:projet/appli/profil/parametre.dart';

import 'profil/info.dart';
class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark=MediaQuery.of(context).platformBrightness==Brightness.dark;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Profil",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //         onPressed: (){},
      //         icon: Icon(isDark? Icons.sunny : Icons.dark_mode)
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("images_projet/user.jpg"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),color: Colors.amber
                      ),
                      child: const Icon(
                          //onPressed: (){},
                          Icons.edit
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 15,),
              Text("Coding with T",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              Text("tadjojeremie8@gmail.com",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
              const SizedBox(height: 15,),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=> const EditUser())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,side: BorderSide.none,shape: const StadiumBorder(),
                  ),
                  child: const Text("Editer le profil",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
                ),
              ),
              const SizedBox(height: 10,),
              const Divider(),
              const SizedBox(height: 10,),

              //Menu
              ProfileMenuWidget(title: "Parametres",icon: Icons.settings,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const ParamPage()));}, endIcon: false,),
              ProfileMenuWidget(title: "Actions",icon: Icons.pending_actions,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const ActionPage()));}, endIcon: false,),
              ProfileMenuWidget(title: "Management",icon: Icons.verified_user,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const ManagementPage()));}, endIcon: false,),
              const Divider(),
              const SizedBox(height: 15,),
              ProfileMenuWidget(title: "Informations",icon: Icons.info,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const InfoPage()));}, endIcon: false,),
              ProfileMenuWidget(title: "Se deconnecter",icon: Icons.logout,onPress: (){}, endIcon: false,textColor: Colors.red,),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key, required this.title, required this.icon, required this.onPress, required this.endIcon, this.textColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color(0xC9DEE7FF),
        ),
        child:  Icon(icon,color: Colors.blue,),
      ),
      title: Text(title,style: TextStyle(color: Colors.black,fontSize: 15),),
      trailing:Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: const Icon(Icons.arrow_forward_ios,size: 18,color: Colors.grey,),
      ),
    );
  }
}

