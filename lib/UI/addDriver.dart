// ignore_for_file: prefer_const_constructors

import 'package:bussystem/Providers/DriverListProvider.dart';
import 'package:bussystem/UI/LaunchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class AddDriver extends StatefulWidget {
  const AddDriver({super.key});

  @override
  State<AddDriver> createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController phoneNumberEditingController = TextEditingController();
  TextEditingController licenseNumberEditingController =
      TextEditingController();
  late DriverListProvider driverListProvider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: DriverListProvider.instance)
        ],
        child: DriverListWidget(),
      ),
    );
  }

  Widget DriverListWidget() {
    return Builder(
      builder: (innercontext) {
        driverListProvider = Provider.of<DriverListProvider>(innercontext);

        return SafeArea(
            child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 120,
              color: const Color(0xff2B2B2B),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
            ),
            SizedBox(
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
                    controller: nameEditingController,
                    decoration: InputDecoration.collapsed(
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: '       Enter name')),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15)),
              width: 300,
              height: 60,
              child: Center(
                child: TextField(
                    controller: phoneNumberEditingController,
                    decoration: InputDecoration.collapsed(
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: '       Enter phone number')),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15)),
              width: 300,
              height: 60,
              child: Center(
                child: TextField(
                    controller: licenseNumberEditingController,
                    decoration: InputDecoration.collapsed(
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: '       Enter License number')),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 40, bottom: 20),
              child: CustomTextButton(
                width: 300,
                height: 60,
                backgroundColor: Colors.red,
                buttonTextColor: Colors.white,
                buttonText: 'Save',
                onPressed: () async {
                  await DriverListProvider.instance.addDriver(
                      name: nameEditingController.text,
                      mobile: phoneNumberEditingController.text,
                      licensenumber: licenseNumberEditingController.text);

                  nameEditingController.clear();
                  phoneNumberEditingController.clear();
                  licenseNumberEditingController.clear();
                 await DriverListProvider.instance.getDriverList();
                },
              ),
            )
          ],
        ));
      },
    );
  }
}
