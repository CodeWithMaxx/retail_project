import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:retail_project/Core/Theme/color_pallets.dart';
import 'package:retail_project/Core/Widget/regcontroller.dart';
import 'package:retail_project/Core/Widget/textfield.dart';
import 'package:retail_project/Feature/Auth/Provider/register_provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends regcontroller {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallets.secondaryColor,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "User Registration",
                  style: GoogleFonts.poppins(
                      color: ColorPallets.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: personNameController,
                  hintText: "Person Name",
                  iconData: Icons.person_2,
                  text: "Person Name",
                  toHide: false,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: pAddController,
                  hintText: "Person Address",
                  iconData: Icons.holiday_village,
                  text: "Address",
                  toHide: false,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: cityController,
                  hintText: "City",
                  iconData: Icons.location_city,
                  text: "City",
                  toHide: false,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: contatNoController,
                  hintText: "Contact Number",
                  iconData: Icons.mobile_friendly,
                  text: "Contact No",
                  toHide: false,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: mobileController,
                  hintText: "Mobile Number",
                  iconData: Icons.phone,
                  text: "Mobile Number",
                  toHide: false,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  iconData: Icons.mail,
                  text: "Email Id..",
                  toHide: false,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: passController,
                  hintText: "Password",
                  iconData: Icons.password_outlined,
                  text: " Password..",
                  toHide: true,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: repassController,
                  hintText: "Retype Password",
                  iconData: Icons.password_outlined,
                  text: "Retype Password..",
                  toHide: true,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: aadharController,
                  hintText: "Aadhar Number",
                  iconData: Icons.install_desktop,
                  text: "Aadhar Number",
                  toHide: false,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: panController,
                  hintText: "Pan Number",
                  iconData: Icons.numbers,
                  text: "Pan Number",
                  toHide: false,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: bankNMController,
                  hintText: "Bank Name",
                  iconData: Icons.comment_bank,
                  text: "Bank Name",
                  toHide: false,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: branchController,
                  hintText: "Bank Branch",
                  iconData: Icons.comment_bank,
                  text: "Bank Branch Name",
                  toHide: false,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: accountController,
                  hintText: "Bank Account Number",
                  iconData: Icons.comment_bank,
                  text: "Bank Account Anumber",
                  toHide: false,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: ifcController,
                  hintText: "IFSC CODE",
                  iconData: Icons.code,
                  text: "IFSC CODE",
                  toHide: false,
                ),
                SizedBox(height: 20),
                Consumer<RegisterProvider>(builder: (_, provider, __) {
                  return ElevatedButton(
                    onPressed: () {
                      provider.userregister(
                          context,
                          personNameController.text,
                          pAddController.text,
                          cityController.text,
                          contatNoController.text,
                          mobileController.text,
                          emailController.text,
                          passController.text,
                          aadharController.text,
                          panController.text,
                          bankNMController.text,
                          branchController.text,
                          accountController.text,
                          ifcController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPallets.primaryColor),
                    child: Text("Submit",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white)),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
