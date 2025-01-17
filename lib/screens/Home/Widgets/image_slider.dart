import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final int currenSlide;
  const ImageSlider({super.key, required this.onChange, required this.currenSlide});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 205,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged: onChange,
              physics: const ClampingScrollPhysics(),
              children: [
                Image.asset(
                  'images/slider.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'images/image1.png',
                  fit: BoxFit.cover,
                ),
                
                Image.asset(
                  'images/slider3.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                  duration:const Duration(microseconds: 300),
                  width: currenSlide==index ?15:8,
                  height: 8,
                  margin:const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color:currenSlide==index ?Colors.black:Colors.transparent,
                  border: Border.all(color:Colors.black ,),
                  ),
                  
                  
                  
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
