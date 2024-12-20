import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:retail_project/Feature/Home/Homepage.dart';
import 'package:retail_project/Feature/Home/Point_redeem_page.dart';
import 'package:retail_project/Feature/Home/Qrcode_page.dart';
import 'package:retail_project/Feature/Home/TransReport.dart';

class BottamNavigationbar extends StatefulWidget {
  const BottamNavigationbar({super.key});

  @override
  State<BottamNavigationbar> createState() => _BottamNavigationbarState();
}

class _BottamNavigationbarState extends State<BottamNavigationbar> {
  int _Currentpage = 0;
  List<Widget> pages = [Homepage(), QRcode(), PointRedeemPage(), TransReport()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bottam"),
        ),
        body: pages[_Currentpage],
        bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: Color.fromARGB(255, 109, 41, 50),
          backgroundColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.ease,
          height: 50,
          items: [
            const Icon(
              Icons.home_filled,
              color: Color.fromARGB(255, 232, 216, 196),
            ),
            const Icon(
              Icons.qr_code_scanner,
              color: Color.fromARGB(255, 232, 216, 196),
            ),
            const Icon(
              Icons.point_of_sale_outlined,
              color: Color.fromARGB(255, 232, 216, 196),
            ),
            const Icon(
              Icons.book_online_outlined,
              color: Color.fromARGB(255, 232, 216, 196),
            ),
          ],
          onTap: (index) {
            setState(() => _Currentpage = index);
          },
        ));
  }
}
