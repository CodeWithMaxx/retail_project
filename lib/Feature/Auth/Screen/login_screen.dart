import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../Core/Theme/color_pallets.dart';
import '../../../Core/Widget/textfield.dart';
import '../Provider/login_provider.dart';
import 'Forgotten_screen.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final LoginProvider loginProvider = LoginProvider();
  final TextEditingController mobileController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallets.secondaryColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LOGIN PAGE',
                style: GoogleFonts.poppins(
                    color: ColorPallets.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: mobileController,
                hintText: 'Mobile Number',
                text: 'Mobile',
                iconData: Icons.phone,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                text: 'Password',
                iconData: Icons.password,
              ),
              const SizedBox(height: 30),
              Consumer<LoginProvider>(
                builder: (_, provider, __) {
                  return ElevatedButton(
                      onPressed: () => provider.userlogin(mobileController.text,
                          passwordController.text, context),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPallets.primaryColor),
                      child: const Text(
                        'LogIn',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white),
                      ));
                },
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 30),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Forgottenscreen()));
                      },
                      child: Text(
                        "Forget Password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: ColorPallets.primaryColor),
                      ),
                    ),
                  ),
                  //  Padding(
                  //    padding: const EdgeInsets.only(left: 10, top: 30),
                  //   child: TextButton(
                  //      onPressed: () {
                  //        Navigator.push(
                  //            context,
                  //            MaterialPageRoute(
                  //                builder: (context) => Changepassword()));
                  //      },      child: Text(
                  //        "Changepassword",
                  //        style: TextStyle(
                  //            fontWeight: FontWeight.bold,
                  //            fontSize: 18,
                  //            color: ColorPallets.primaryColor),
                  //      ),
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
