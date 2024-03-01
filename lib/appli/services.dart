import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.blue,
              Colors.blueAccent,
              Colors.blue,
            ]
          )
        ),
        child: Column(
          children: [
            Padding(
              child: Text("Parcourez nos differents services pour vos besoins de creation d'actes!",
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22),),
                padding: EdgeInsets.all(40)
            ),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: StaggeredGrid.count(
                              crossAxisCount: 4,
                            mainAxisSpacing: 5.0,
                            crossAxisSpacing: 5.0,

                          ),
                        )
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
}


class Info {
  String images;
  String titles;
  String city;

  Info({required this.images, required this.titles, required this.city});
}

List<Info> infos = [
  Info(images: '../images/.jpg', titles: "Luxury-Hono", city: 'Toronto'),
  Info(images: '../images/8.jpg', titles: "Luxury-Hono", city: 'Toronto'),
  Info(images: '../images/8.jpg', titles: "Luxury-Hono", city: 'Toronto'),
];

class Showinfo extends StatelessWidget {
  final Info verif;
  const Showinfo({super.key, required this.verif});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(verif.images),
        ),
        Text(verif.titles,style: TextStyle(fontWeight: FontWeight.bold),),
        Text(verif.city,style: TextStyle(fontWeight: FontWeight.bold),),
        const SizedBox(height: 30,),
      ],
    );
  }
}
