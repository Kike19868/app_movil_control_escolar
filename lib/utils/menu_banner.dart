import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mesadeservicio/data/Info.dart';
import 'package:mesadeservicio/data/Info_data.dart';
import 'package:mesadeservicio/models/carrusel.dart';
import 'package:flutter/cupertino.dart';


class MenuBanner extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => BannerState();
}

class BannerState extends State<MenuBanner>{

  int index = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context){
    // TODO: implement build
    return SizedBox(height: 450,
      child: Column(children: [
        //CARRUSEL ===================== 
         CarouselSlider.builder(
            itemCount: carruselImages.length,
            itemBuilder: (context, index, realIndex) {
              // ignore: unused_local_variable
              final carruselImage = carruselImages[index];
              return CardImages(carruselImages: carruselImages[index],);
            },
            options: CarouselOptions(
              height: 300.0,
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 5),
              scrollDirection: Axis.horizontal,
            ),
          ),
        
       // BannerButtons(index, _controller)
       
      ],),
    );
  }

  void onPageChange(int index, CarouselPageChangedReason reason){
    setState(() {
      this.index=index;
    });
  }
}
// <==============================
class CardImages extends StatelessWidget { 
  final Info carruselImages;
  const CardImages({Key? key, required this.carruselImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {
            carruselImages.copy();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MostrarInfo(
                        
                        )));
          },
          child: FadeInImage(
            placeholder: const AssetImage("assets/loading1.gif"),
            image: AssetImage(carruselImages.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

