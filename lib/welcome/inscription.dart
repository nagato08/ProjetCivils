import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'connection.dart';
class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  Uint8List? _image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
        centerTitle: true,
        elevation:0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon:const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Form(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        _image!=null?

                        CircleAvatar(
                          radius: 70,
                          backgroundImage:(MemoryImage(_image!)),
                        ):const CircleAvatar(
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
                              child:IconButton(
                                onPressed: (){
                                  showImagePickerOption(context);
                                },
                                icon:const Icon(Icons.camera_alt),
                              )
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30,),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "UserName",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        prefixIcon:const Icon(Icons.person),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 20,),
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
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Telephone",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        prefixIcon:const Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Mot de passe",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        prefixIcon:const Icon(Icons.fingerprint),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Confirmer mot de passe",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        prefixIcon:const Icon(Icons.fingerprint),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){},

                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.all(13)
                        ),
                        child:const Text("Inscription",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Vous avez deja un compte?",
                          style: TextStyle(
                              fontSize: 15
                          ),
                        ),
                        TextButton(
                            onPressed: (){
                              Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context)=>const ConnectionPage())
                              );
                            },
                            child:const Text("Connexion!",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                                color: Colors.lightBlueAccent,

                              ),
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
  void showImagePickerOption(BuildContext context){
    showModalBottomSheet(
        backgroundColor: Colors.blue[100],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        _pickImageFromGallery();
                      },
                      child:const SizedBox(
                        child: Column(
                          children: [
                            Icon(Icons.image,size: 70,),Text("Gallery"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        _pickImageFromCamera();
                      },
                      child:const SizedBox(
                        child: Column(
                          children: [
                            Icon(Icons.camera_alt,size: 70,),Text("Camera"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  //Gallery
  Future _pickImageFromGallery() async{
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnImage == null)return;
    setState(() {
      selectedImage=File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();

    });
    Navigator.of(context).pop();
  }

  //Camera
  Future _pickImageFromCamera() async{
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if(returnImage == null)return;
    setState(() {
      selectedImage=File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();

    });
    Navigator.of(context).pop();
  }
}
