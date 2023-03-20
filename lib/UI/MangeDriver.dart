import 'package:bussystem/Providers/DriverListProvider.dart';
import 'package:bussystem/UI/LaunchScreen.dart';
import 'package:bussystem/UI/addDriver.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ManageDriver extends StatefulWidget {
  const ManageDriver({super.key});

  @override
  State<ManageDriver> createState() => _ManageDriverState();
}

class _ManageDriverState extends State<ManageDriver> {
  late DriverListProvider driverListProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: DriverListProvider.instance)
        ],
        child: DriverList(),
      ),
    );
  }

  Widget DriverList() {
    return Builder(
      builder: (innercontext) {
        driverListProvider = Provider.of<DriverListProvider>(innercontext);
        return driverListProvider.driverlistsytatus ==
                DriverlistServiceStatus.loadedState
            ? SafeArea(
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
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
                      child: Text(
                          "${driverListProvider.driverList!.length.toString()} Drivers found")),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    shrinkWrap: true,
                    itemCount: driverListProvider.driverList!.length,
                    itemBuilder: (context, index) {
                      //  DriverModelData? driverList = driverListProvider.data;
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          subtitle: Text(driverListProvider
                              .driverList![index].licenseNo
                              .toString()),
                          trailing: CustomTextButton(
                            width: 70,
                            buttonTextSize: 10,
                            height: 30,
                            backgroundColor: Colors.red,
                            buttonTextColor: Colors.white,
                            buttonText: 'Delete',
                            onPressed: () async {
                              await DriverListProvider.instance.deleteDriver(
                                  id: driverListProvider.driverList![index].id
                                      .toString());
                              await DriverListProvider.instance.getDriverList();
                            },
                          ),
                          leading: Container(
                            color: Colors.grey.shade200,
                            child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 45,
                                backgroundImage:
                                    AssetImage('assets/images/driver.png')),
                          ),
                          title: Text(driverListProvider.driverList![index].name
                              .toString()),
                        ),
                      );
                    },
                  )),
                  Container(
                    padding: const EdgeInsets.only(left: 50, bottom: 20),
                    child: CustomTextButton(
                      width: 300,
                      height: 60,
                      backgroundColor: Colors.red,
                      buttonTextColor: Colors.white,
                      buttonText: 'Add Driver',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const AddDriver();
                          },
                        ));
                      },
                    ),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ))
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
