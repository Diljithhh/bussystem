import 'package:bussystem/UI/LaunchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween
      ,
        children: [
          Stack(
            children: [
              Positioned(
                  child: Container(
                child: Image.asset(
                  fit: BoxFit.cover,width: double.maxFinite,
                  'assets/images/Rectangle.png'),
              ))
            ,Positioned(
                  child: Container(
                child: Image.asset(
                  //fit: BoxFit.cover,
                  width: double.maxFinite,
                  'assets/images/Polygon.png'),
              )),const Positioned( 
                left: 20,
                bottom: 0,top: 10,
              
                child: Center(
                  child: Text('Welcome',style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,fontWeight: FontWeight.w700),),
                )) ,const Positioned( 
                left: 20,
                bottom: 0,top: 100,
              
                child: Center(
                  child: Text('Manage your Bus and Drivers',style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,fontWeight: FontWeight.w400),),
                )) ],
          )
      ,  
      //SizedBox(height: 10,),
     Container(padding: const EdgeInsets.only(bottom: 100),
       child: Column(
        
        mainAxisAlignment: MainAxisAlignment.start,
        children: [  CustomTextButton(
          buttonText: 'Enter Username',
          width: 300, height: 60, backgroundColor: Colors.grey.shade300,
          buttonTextColor: Colors.black, onPressed: () {
            
          },)
          ,
          const SizedBox(height: 20,),
          CustomTextButton(
          buttonText: 'Enter Password',
          width: 300, height: 60, backgroundColor: Colors.grey.shade300,
          buttonTextColor: Colors.black, onPressed: () {
            
          },),
          ],),
     )
        ,
        Container(padding: const EdgeInsets.only(bottom: 60),
          child: CustomTextButton(buttonText: 'Login',
                backgroundColor: Colors.red,
                buttonTextColor: Colors.white,
                onPressed: () {
                  
                },
                width: 300,
                height: 60,
              ),
        ) ],
      ),
    ));
  }
}
