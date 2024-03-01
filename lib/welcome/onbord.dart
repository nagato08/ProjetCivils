import 'package:flutter/material.dart';
import 'package:projet/welcome/onbord_model.dart';

import 'inscription.dart';
class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
                onPageChanged: (int index){
                setState(() {
                  currentIndex = index;
                });
                },
                itemBuilder: (_,i){
                  return Padding(
                      padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Image.asset(contents[i].image,
                        height: 300,
                        ),
                        Text(contents[i].title,
                          style:const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Text(contents[i].description,
                          style:const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),

                        ),
                      ],
                    ),
                  );
                }
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  contents.length,
                      (index) => buildDot(index,context),

                      ),
              ),
            ),

          Container(
            height: 60,
            margin: EdgeInsets.all(20),
            width: double.infinity,
            child:ElevatedButton(
              onPressed: (){
                if(currentIndex==contents.length -1){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>const InscriptionPage())
                  );
                }
                _controller.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn,

                );

              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.all(13)
              ),
              child:Text(
                currentIndex == contents.length -1 ? "Continuer": "Suivant",
                style:const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black
                ),
              ),

            ),
          )
        ],
      ),
    );
  }
  Container buildDot(int index, BuildContext context){
    return Container(
      height: 10,
      width: currentIndex == index?25:10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueAccent
      ),
    );
  }

}
