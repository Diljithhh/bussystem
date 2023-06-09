import 'package:bussystem/Providers/BusListProvider.dart';
import 'package:bussystem/Providers/DriverListProvider.dart';
import 'package:bussystem/Providers/LoginServiceProvider.dart';
import 'package:bussystem/UI/HomeScreen.dart';
import 'package:bussystem/UI/LaunchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController usernametextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Positioned(
                    child: Container(
                  child: Image.asset(
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                      'assets/images/Rectangle.png'),
                )),
                Positioned(
                    child: Container(
                  child: Image.asset(
                      //fit: BoxFit.cover,
                      width: double.maxFinite,
                      'assets/images/Polygon.png'),
                )),
                const Positioned(
                    left: 20,
                    bottom: 0,
                    top: 10,
                    child: Center(
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    )),
                const Positioned(
                    left: 20,
                    bottom: 0,
                    top: 100,
                    child: Center(
                      child: Text(
                        'Manage your Bus and Drivers',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ))
              ],
            ),
            //SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15)),
                    width: 300,
                    height: 60,
                    child: Center(
                      child: TextField(
                          controller: usernametextEditingController,
                          decoration: const InputDecoration.collapsed(
                              hintStyle: TextStyle(color: Colors.black),
                              hintText: '       Enter License number')),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15)),
                    width: 300,
                    height: 60,
                    child: Center(
                      child: TextField(
                          controller: passwordtextEditingController,
                          decoration: const InputDecoration.collapsed(
                              hintStyle: TextStyle(color: Colors.black),
                              hintText: '       Enter License number')),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 60),
              child: CustomTextButton(
                buttonText: 'Login',
                backgroundColor: Colors.red,
                buttonTextColor: Colors.white,
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreenUi(),
                      ));

                  await LoginServiceProvider.instance.login(
                      username: usernametextEditingController.text,
                      password: passwordtextEditingController.text);
                  await BusListProvider.instance.BuslistService();
                  await BusListProvider.instance.getSeatdetailslocal();
                },
                width: 300,
                height: 60,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
