import 'package:bussystem/UI/LaunchScreen.dart';
import 'package:bussystem/UI/addDriver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ManageDriver extends StatefulWidget {
  const ManageDriver({super.key});

  @override
  State<ManageDriver> createState() => _ManageDriverState();
}

class _ManageDriverState extends State<ManageDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        // ignore: sort_child_properties_last
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
                    'Driver List',
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
          Container(
              padding: const EdgeInsets.only(left: 20),
              child: const Text('21 Drivers Found')),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  subtitle: const Text('Licn no: PJ5151961616'),
                  trailing: CustomTextButton(
                    width: 70,
                    buttonTextSize: 10,
                    height: 30,
                    backgroundColor: Colors.red,
                    buttonTextColor: Colors.white,
                    buttonText: 'Delete',
                    onPressed: () {},
                  ),
                  leading: Container(
                    color: Colors.grey.shade200,
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 45,
                        backgroundImage:
                            AssetImage('assets/images/driver.png')),
                  ),
                  title: const Text('Rohit Sharma'),
                ),
              );
            },
          )),
          Container(
            padding: EdgeInsets.only(left: 50, bottom: 20),
            child: CustomTextButton(
              width: 300,
              height: 60,
              backgroundColor: Colors.red,
              buttonTextColor: Colors.white,
              buttonText: 'Add Driver',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AddDriver();
                  },
                ));
              },
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      )),
    );
  }
}
