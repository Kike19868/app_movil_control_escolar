import 'package:flutter/material.dart';


import '../buttons/btn_slider.dart';
//
class MenuSliderCard extends StatelessWidget{
 // Menu menu;
//MenuSliderCard(this.menu, {super.key});
  @override
  Widget build(BuildContext context){
    // TODO
    return Card(
  //  color: menu.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
        
      ),
    //  ==============================
      child: Padding(
        padding:const EdgeInsets.only(top: 20.0),
        child: Stack(
          children: [
            
            
            Positioned(
                right: 0.0,
                bottom: 10.0,
                child: btn_slider())
          ],
        ),
      ),
    );
  }
}
//