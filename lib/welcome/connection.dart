import 'package:flutter/material.dart';

import '../appli/menu_navigation.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  bool isLoading = true;
  String value = '';
  String mail = '';
  String mdp = '';

  var _obscuretext = true;
  final formkey = GlobalKey<FormState>();


  validationform() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      debugPrint(mail);
      debugPrint(mdp);
      formkey.currentState!.reset();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) =>const NavigationMenu())
      );

    } else {
      debugPrint("Erreur ");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images_projet/plan-100.jpg"),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation:0,
          backgroundColor: Colors.white.withOpacity(0),
          leading: IconButton(
            icon:const Icon(
              Icons.close,
              color: Colors.black,
              size: 30,
            ),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Form(
          key: formkey,
          child: Stack(
            children: [
              Container(
                padding:const EdgeInsets.only(
                    left: 35,
                    top: 55
                ),
                child:const Text(
                  "Bon\nRetour",
                  style: TextStyle(color: Colors.white,fontSize: 33),

                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding:const EdgeInsets.only(
                      top: 250,right: 35,left: 35
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)
                            ),
                          prefixIcon:const Icon(Icons.mail),
                        ),
                        validator: (val){
                          if(val!.isEmpty ||!RegExp(r'^[\w-.]+@([\w-]+\.)+\w{2,4}').hasMatch(val)){
                            return "Entrer une adresse email valide";
                          }else{
                            return null;
                          }
                        },
                        onSaved: (val) => mail = val!,
                        keyboardType: TextInputType.text,

                      ),
                      const SizedBox(height: 20,),
                      TextFormField(

                        decoration: InputDecoration(
                            prefixIcon:const Icon(Icons.fingerprint),
                            suffixIcon: IconButton(
                              icon:const Icon(
                                Icons.visibility,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscuretext = !_obscuretext;
                                });
                              },
                            ),

                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Mot de passe",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)
                            )
                        ),

                        validator: (val) => val!.isEmpty ? "Entrer votre mot de passe" : null,
                        onSaved: (val) => mdp = val!,
                        keyboardType: TextInputType.text,
                        obscureText: _obscuretext,
                      ),
                      const SizedBox(height: 30,),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.all(13)
                          ),
                          onPressed: validationform,
                          child:const Text("Connexion",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Mot de passe oublie?",
                            style: TextStyle(
                              fontSize: 18
                            ),
                          ),
                          TextButton(
                              onPressed: (){},
                              child:const Text("Cliquez ici!",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Colors.lightBlueAccent,

                                ),
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
