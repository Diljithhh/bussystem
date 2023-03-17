import 'package:bussystem/UI/LaunchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddDriver extends StatefulWidget {
  const AddDriver({super.key});

  @override
  State<AddDriver> createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(children: [ Container(
              width: double.maxFinite,
              height: 120,
              color: const Color(0xff2B2B2B),
              child: Row(
                
                mainAxisAlignment: 
                MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 100,
                  ),
                  const Center(
                    child: Text(
                      'Add Driver',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
            
          ,
          
            SizedBox(height: 10,) ,
          
           CustomTextButton(width: 300, height:60,
            backgroundColor: Colors.grey.shade300, 
            buttonTextColor: Colors.black, 
            buttonText: 'Enter Name', onPressed: () {
              
            },),
            SizedBox(height: 10,) ,
             CustomTextButton(width: 300, height:60,
            backgroundColor: Colors.grey.shade300, 
            buttonTextColor: Colors.black, 
            buttonText: 'Enter License Number', onPressed: () {
              
            },) ],)),);
  }
}