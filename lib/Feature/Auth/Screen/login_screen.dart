import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:retail_project/Feature/Auth/Screen/Register.dart';
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
                height: 50,
              ),
              CustomTextField(
                controller: mobileController,
                hintText: 'Mobile Number',
                text: 'Mobile',
                iconData: Icons.phone,
                toHide: false,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                text: 'Password',
                iconData: Icons.password,
                toHide: true,
              ),
              const SizedBox(height: 50),
              Consumer<LoginProvider>(
                builder: (_, provider, __) {
                  return Container(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () => provider.userlogin(
                            mobileController.text,
                            passwordController.text,
                            context),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPallets.primaryColor),
                        child: const Text(
                          'LogIn',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white),
                        )),
                  );
                },
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 20),
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 150),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterForm()));
                  },
                  child: Text(
                    "Don't have an Account ? Register",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: ColorPallets.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
