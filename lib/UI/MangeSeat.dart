// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MangeSeat extends StatefulWidget {
  const MangeSeat({
    Key? key,
    required this.seatCount,
    required this.layOut,
  }) : super(key: key);
  final String seatCount;
  final String layOut;
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
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: oneTwoSeatLayout(layOut: widget.layOut,
              seatCount: widget.seatCount,
            ))
          ],
        ),
      ),
    );
  }
}

class oneTwoSeatLayout extends StatefulWidget {
  const oneTwoSeatLayout({
    Key? key,
    required this.seatCount,
    required this.layOut,
  }) : super(key: key);

  final String seatCount;
  final String layOut;

  @override
  State<oneTwoSeatLayout> createState() => _oneTwoSeatLayoutState();
}

class _oneTwoSeatLayoutState extends State<oneTwoSeatLayout> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return widget.layOut == '2*2' ? SeatWidget1_2() : SeatWidget1_23();
        },
        separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
        itemCount: widget.layOut=="2*2"?(int.parse(widget.seatCount)/4).toInt():(int.parse(widget.seatCount)/5).toInt());
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
        SizedBox(
          width: 10,
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
