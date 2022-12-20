import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../models/test/board.dart';

class SlideImage extends StatefulWidget {
  const SlideImage({Key? key, this.board}) : super(key: key);
  final board;
  @override
  State<SlideImage> createState() => _SlideImageState();
}

class _SlideImageState extends State<SlideImage> {
  int activeIndex = 0;
  //final Board board;
  late int index;
  final List<Board> lists = List.of(Boards);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              autoPlay: true,
              height: 200,
              reverse: false,
              viewportFraction: 1,
              enlargeCenterPage: true,
              //enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
            itemCount: 3,
            itemBuilder: (context, index, realIndex) => buildImage(index),

            /* (context, index, realIndex) {
              //final sImage = sImages[index];
              //return buildImage(sImage, index);

              return buildImage(index);
            },*/
          ),
          const SizedBox(height: 14),
          buildIndicator(),
        ],
      ),
    );
  }

  Widget buildImage(int index) {
    return FractionallySizedBox(
      widthFactor: 0.92,
      child: Container(
        //margin: EdgeInsets.symmetric(horizontal: 2),
        //color: Colors.grey,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          child: Image.asset(
            widget.board.boardImg[index],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: 3,
      effect: SlideEffect(
        dotWidth: 6,
        dotHeight: 6,
        activeDotColor: createMaterialColor(Color(0xff6E34DA)),
        dotColor: kchacholGreyColor(),
      ),
    );
  }
}
