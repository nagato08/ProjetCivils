import 'package:flutter/material.dart';
import 'package:projet/appli/profil/editprofil.dart';
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

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

              const SizedBox(height: 15,),
              Text("Menu rapides",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              const SizedBox(height: 10,),
              const Divider(),
              const SizedBox(height: 10,),

              //Menu
              ProfileMenuWidget(title: "Listes des demandes",icon: Icons.list_alt,onPress: (){}, endIcon: false,),
              ProfileMenuWidget(title: "Zones couvertes",icon: Icons.language,onPress: (){}, endIcon: false,),
              ProfileMenuWidget(title: "Nouvelle demande d'extrait",icon: Icons.document_scanner_outlined,onPress: (){}, endIcon: false,),
              const SizedBox(height: 15,),
              Text("Services",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              const Divider(),
              const SizedBox(height: 15,),
              ProfileMenuWidget(title: "Termes et condition d'utilisation",icon: Icons.gpp_good,onPress: (){}, endIcon: false,),
              ProfileMenuWidget(title: "Foire aux questions",icon: Icons.question_answer,onPress: (){}, endIcon: false,textColor: Colors.red,),
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
      trailing: Container(
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

