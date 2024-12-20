import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:retail_project/Feature/Home/Point_redeem_page.dart';
import 'Qrcode_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _Currentpage = 0;
  List<Widget> pages = [Navbar(), QRcode(), PointRedeemPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("pointReddem")),
      body: pages[_Currentpage],
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Color.fromARGB(255, 109, 41, 50),
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.ease,
        height: 50,
        items: [
          const Icon(
            Icons.book_online_outlined,
            color: Color.fromARGB(255, 232, 216, 196),
          ),
          const Icon(
            Icons.home_filled,
            color: Color.fromARGB(255, 232, 216, 196),
          )
        ],
        onTap: (index) {
          setState(() => _Currentpage = index);
        },
      ),
    );
  }
}
