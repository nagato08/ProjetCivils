import 'package:flutter/material.dart';

class Deces1 extends StatefulWidget {
  const Deces1({super.key});

  @override
  State<Deces1> createState() => _Deces1State();
}
enum reponse{OUI,NON}
class _Deces1State extends State<Deces1> {

  final formkey = GlobalKey<FormState>();

  validationform() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();

      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (_) =>const Naissance1())
      // );
      switch (await showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          title:const Text("Prenez la peine de reverifier vos informations!! Continuez?",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.redAccent),
          ),
          children: [
            SimpleDialogOption(
              child:const Text("Oui"),
              onPressed: (){
              //   Navigator.pushReplacement(
              //       context,
              //       MaterialPageRoute(
              //           builder: (_) =>const Naissance1())
              //   );
               },
            ),
            SimpleDialogOption(
              child:const Text("Non"),
              onPressed: (){
                Navigator.pop(context,reponse.NON);
              },
            ),
          ],
        ),
      )
      ){}
      //formkey.currentState!.reset();
    } else {
      debugPrint("Erreur ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Conception de l'acte de deces",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:const EdgeInsets.only(
              top: 35,right: 35,left: 35
          ),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const Text("Veuillez remplir le formulaire ci-dessous pour concevoir un acte de naissance",
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    label: Text("Lieu de naissance du decede(e)"),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  validator: (val) => val!.isEmpty ? "Entrer le lieu de naissance du decede(e)" : null,
                  //onSaved: (val) => mail = val!,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    label: Text("Profession du decede(e)"),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  validator: (val) => val!.isEmpty ? "Entrer la profession du decede(e)" : null,
                  //onSaved: (val) => mail = val!,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    label: Text("Domicile du decede(e)"),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  validator: (val) => val!.isEmpty ? "Entrer le domicile du decede(e)" : null,
                  //onSaved: (val) => mail = val!,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    label:const Text("Nom du pere"),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  validator: (val) => val!.isEmpty ? "Entrer le nom du pere" : null,
                  //onSaved: (val) => mail = val!,
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    label: Text("Domicile du pere"),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  validator: (val) => val!.isEmpty ? "Entrer le domicile du pere" : null,
                  //onSaved: (val) => mail = val!,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    label: Text("Nom de la mere"),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  validator: (val) => val!.isEmpty ? "Entrer le nom de la mere" : null,
                  //onSaved: (val) => mail = val!,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    label:const Text("Domicile de la mere"),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  validator: (val) => val!.isEmpty ? "Entrer le domicile de la mere" : null,

                  //onSaved: (val) => mail = val!,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20,),
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
                    child:const Text("Suivant",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
