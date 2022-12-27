// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/widgets/icon_text_widget.dart';

import '../utils/colors.dart';
import '../widgets/big__text.dart';
import 'package:flutter/material.dart';

import '../widgets/small_text.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 220;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.redAccent,
          height: 320,
          child: PageView.builder(
              controller: _pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            color: Colors.grey[300]!,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    // if (index == _currentPageValue.floor()) {
    //   _matrix = _matrix.scaled(1.0, 1.0);
    // } else if (index == _currentPageValue.floor() + 1) {
    //   _matrix = _matrix.scaled(0.9, 0.9);
    // } else {
    //   _matrix = _matrix.scaled(0.8, 0.8);
    // }

    const stars = 5; //this will be a variable later on

    return Transform(
        transform: matrix,
        child: Stack(
          children: [
            Container(
                height: 220,
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/food02.jpg')))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120,
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFe8e8e8),
                        offset: Offset(0, 5),
                        blurRadius: 5.0,
                        // spreadRadius: 5.0
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, 0),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, 0),
                      )
                    ]),
                child: Container(
                  padding: EdgeInsets.only(top: 15, right: 15, left: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(
                          text: "Chinese Side",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(stars,
                                  (index) => _StarsGenerator(index: index)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SmallText(
                              text: "4.5",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SmallText(
                              text: "1287",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SmallText(
                              text: "Comments",
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconAndTextWidget(
                              icon: Icons.circle_sharp,
                              text: "Normal",
                              iconColor: AppColors.iconColor1,
                            ),
                            IconAndTextWidget(
                              icon: Icons.location_on,
                              text: "1.7km",
                              iconColor: AppColors.mainColor,
                            ),
                            IconAndTextWidget(
                              icon: Icons.access_alarm_rounded,
                              text: "32min",
                              iconColor: AppColors.iconColor2,
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            )
          ],
        ));
  }
}

Widget _StarsGenerator({required int index}) {
  return Icon(Icons.star, color: AppColors.mainColor, size: 15);
}
