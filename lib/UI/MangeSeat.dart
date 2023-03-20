// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MangeSeat extends StatefulWidget {
  const MangeSeat({super.key});

  @override
  State<MangeSeat> createState() => _MangeSeatState();
}

class _MangeSeatState extends State<MangeSeat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 120,
              color: const Color(0xff2B2B2B),
              child: Row(
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
                    width: 40,
                  ),
                  const Text(
                    'KSRTC SWIFT SCANIA P-series',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 10),
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                  color: const Color(0xff2B2B2B),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Rohit Sharma',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'License no:jadhjahdkjhakjd',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      )
                    ],
                  ),
                  Image.asset('assets/images/driver.png')
                ],
              ),
            ),
  
  SizedBox(height: 20,),
            Expanded(child: oneTwoSeatLayout())
          ],
        ),
      ),
    );
  }
}

class oneTwoSeatLayout extends StatelessWidget {
  const oneTwoSeatLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
      return    SeatWidget1_23();
        },
        separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
        itemCount: 3);
  }
}

class SeatWidget1_2 extends StatelessWidget {
  const SeatWidget1_2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
        ),
        Container(
          child: Image.asset('assets/images/Seat.png'),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          child: Image.asset('assets/images/Seat.png'),
        ),
        SizedBox(
          width: 60,
        ),
        Container(
          child: Image.asset('assets/images/Seat.png'),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          child: Image.asset('assets/images/Seat.png'),
        )
      ],
    );
  }
}



class SeatWidget1_23 extends StatelessWidget {
  const SeatWidget1_23({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
        ),
        Container(
          child: Image.asset('assets/images/Seat.png'),
        ),
        SizedBox(
          width: 50,
        ),
        Container(
          child: Image.asset('assets/images/Seat.png'),
        ),
     SizedBox(width: 10,),  
        Container(
          child: Image.asset('assets/images/Seat.png'),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          child: Image.asset('assets/images/Seat.png'),
        )
      ],
    );
  }
}
