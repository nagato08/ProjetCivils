//import 'dart:html';
import 'dart:typed_data';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class EditUser extends StatefulWidget {
  const EditUser({super.key});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  Uint8List? _image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
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
          padding: const EdgeInsets.all(40),
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
              const SizedBox(height: 40,),
              Form(
                child: Column(
                  children: [
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
                    const SizedBox(height: 30,),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,side: BorderSide.none,shape: const StadiumBorder(),
                        ),
                        child: const Text("Changer le profil",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                            TextSpan(
                                text: "Joined",style: TextStyle(
                                fontSize: 20,fontWeight: FontWeight.normal
                            ),
                                children: [
                                  TextSpan(
                                    text: "Date du jour",style: TextStyle(
                                      fontSize: 20,fontWeight: FontWeight.w700
                                  ),
                                  )
                                ]
                            )
                        ),
                        ElevatedButton(
                          onPressed: (){},
                          child: const Text("Effacer"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent.withOpacity(0.1),
                            elevation: 0,
                            foregroundColor: Colors.red,
                            shape: const StadiumBorder(),
                            side: BorderSide.none,
                          ),

                        ),
                      ],
                    )

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

