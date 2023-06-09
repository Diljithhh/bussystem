import 'package:bussystem/Providers/BusListProvider.dart';
import 'package:bussystem/Providers/DriverListProvider.dart';
import 'package:bussystem/Providers/LoginServiceProvider.dart';
import 'package:bussystem/UI/LaunchScreen.dart';
import 'package:bussystem/UI/MangeDriver.dart';
import 'package:bussystem/UI/MangeSeat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class HomeScreenUi extends StatefulWidget {
  const HomeScreenUi({super.key});

  @override
  State<HomeScreenUi> createState() => _HomeScreenUiState();
}

class _HomeScreenUiState extends State<HomeScreenUi> {
  late LoginServiceProvider loginServiceProvider;
  late BusListProvider busListProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: LoginServiceProvider.instance),
          ChangeNotifierProvider.value(value: BusListProvider.instance)
        ],
        child: HomeWidget(),
      ),
    );
  }

  Widget HomeWidget() {
    return Builder(
      builder: (innercontext) {
        busListProvider = Provider.of<BusListProvider>(innercontext);
        loginServiceProvider = Provider.of<LoginServiceProvider>(innercontext);
        return loginServiceProvider.loginstatus ==
                Loginstatus.refreshToken2loaded
            ? SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 120,
                      color: const Color(0xff2B2B2B),
                      child: Image.asset('assets/images/moovbe.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 180,
                          width: 170,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            children: [
                              const Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Text(
                                    'Bus',
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  )),
                              const Positioned(
                                  left: 10,
                                  top: 40,
                                  child: Text(
                                    'Manage your Bus',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  )),
                              Positioned(
                                  bottom: 10,
                                  right: 0,
                                  child: Image.asset('assets/images/bus1.png'))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ManageDriver(),
                                ));
                            await DriverListProvider.instance.getDriverList();
                          },
                          child: Container(
                            height: 180,
                            width: 170,
                            decoration: BoxDecoration(
                                color: const Color(0xff2B2B2B),
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(
                              children: [
                                const Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Text(
                                      'Driver',
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )),
                                const Positioned(
                                    top: 40,
                                    left: 10,
                                    child: Text(
                                      'Manage your Driver',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    )),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child:
                                        Image.asset('assets/images/driver.png'))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                         "${busListProvider.buslist!.length.toString()} bus found",
                          style: TextStyle(color: Colors.grey.shade600),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: busListProvider.buslist!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {




                          return ListTile(
                            subtitle: const Text('Swift Scania P -Series'),
                            trailing: CustomTextButton(
                              width: 70,
                              buttonTextSize: 10,
                              height: 30,
                              backgroundColor: Colors.red,
                              buttonTextColor: Colors.white,
                              buttonText: 'Manage',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MangeSeat(layOut:busListProvider.buslist![index].seatLayout.toString() ,
                                      seatCount:busListProvider.buslist![index].seatCount.toString() ),
                                    ));
                              },
                            ),
                            leading: Image.asset('assets/images/buss2.png'),
                            title: const Text('KSRTC'),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
