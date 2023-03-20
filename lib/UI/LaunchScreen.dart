// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:bussystem/Providers/LoginServiceProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:bussystem/UI/WelcomeScreen.dart';

class LaunchWidget extends StatefulWidget {
  const LaunchWidget({super.key});

  @override
  State<LaunchWidget> createState() => _LaunchWidgetState();
}

class _LaunchWidgetState extends State<LaunchWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      color: Colors.red,
      padding: const EdgeInsets.all(10),
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Positioned(
            left: 10,
            right: 10,
            top: 20,
            bottom: 20,
            child: Container(
              child: Image.asset('assets/images/moovbe.png'),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            child: CustomTextButton(
              buttonText: 'Get Started',
              backgroundColor: Colors.white,
              buttonTextColor: Colors.red,
              onPressed: ()  {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomeScreen(),
                    ));


              },
              width: 300,
              height: 60,
            ),
          )
        ],
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final double width;
  final double height;

  final Color backgroundColor;
  final Color buttonTextColor;
  final String buttonText;
  final double buttonTextSize;

  final VoidCallback onPressed;

  CustomTextButton({
    this.buttonTextSize = 20,
    Key? key,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.buttonTextColor,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(15)),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
              color: buttonTextColor,
              fontWeight: FontWeight.w500,
              fontSize: buttonTextSize,
            ),
          )),
    );
  }
}
