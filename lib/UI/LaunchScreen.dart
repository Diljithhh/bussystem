import 'dart:ffi';

import 'package:bussystem/UI/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
      height: double.maxFinite, width: double.maxFinite,
      color: Colors.red,
        padding: const EdgeInsets.all(10),
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Positioned(left: 10,right: 10,top: 20,bottom: 20,
            child: Container(
              child: Image.asset('assets/images/moovbe.png'),
            ),
          ),
          Positioned(left: 10,right: 10,bottom: 10,
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: TextButton(onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) =>WelcomeScreen() )
);



              }, child: Text(
                style: const TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 20,),
                'Get Started')),
            ),
          )
        ],
      ),
    );
  }
}
