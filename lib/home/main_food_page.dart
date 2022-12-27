// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:ecommerce_app/home/food_page_body.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/widgets/big__text.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
      children: [
            //this is the header section
        Container(
          child: Container(
              margin: EdgeInsets.only(
                top: 45,
                bottom: 15,
              ),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: "Ghana",
                          color: AppColors.mainColor,
                        ),
                        Row(children: [
                          SmallText(text: "Accra", color: Colors.black54),
                          Icon(Icons.arrow_drop_down_rounded,
                              color: Colors.black54)
                        ])
                      ],
                    ),
                    Center(
                        child:
                    Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(Icons.search, color: Colors.white)))
                  ])),
        ),
            //this is the body section
        FoodPageBody()
      ],
    )
    );
  }
}
