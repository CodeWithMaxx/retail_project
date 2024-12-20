import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../Core/Theme/color_pallets.dart';
import '../../../Core/Widget/textfield.dart';
import '../Provider/change_provider.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController expasswordController = TextEditingController();
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
                        'Change password',
                        style: GoogleFonts.poppins(
                            color: ColorPallets.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Please set a new password',
                        style: GoogleFonts.poppins(
                            color: ColorPallets.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                          controller: mobileController,
                          hintText: "Mobile Number",
                          iconData: Icons.phone,
                          text: "Mobile"),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        controller: passwordController,
                        hintText: 'Existing Password',
                        text: 'Old Password',
                        iconData: Icons.password,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        controller: expasswordController,
                        hintText: 'Change Password',
                        text: 'New Password',
                        iconData: Icons.password,
                      ),
                      const SizedBox(height: 30),
                      //      if (ChangeProvider.isLoadig)
                      //CircularProgressIndicator()
                      //else
                      Consumer<ChangeProvider>(builder: (_, provider, __) {
                        return ElevatedButton(
                          onPressed: () {
                            // final existingPassword = expasswordController.text;
                            // final password = passwordController.text;
                            // final mobileNumber = mobileController.text;
                            provider.changePassword(
                                context,
                                expasswordController.text,
                                mobileController.text,
                                passwordController.text);

                            //        ChangeProvider.changePassword(existingPassword, password, mobileNumber);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorPallets.primaryColor),
                          child: Text("Change Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white)),
                        );
                      })
                    ]))));
  }
}
