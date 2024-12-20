import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Core/Theme/color_pallets.dart';
import '../../../Core/Widget/textfield.dart';
import '../Provider/forgot_provider.dart';


class Forgottenscreen extends StatefulWidget {
  const Forgottenscreen({super.key});

  @override
  State<Forgottenscreen> createState() => _ForgottenscreenState();
}

class _ForgottenscreenState extends State<Forgottenscreen> {
  final TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallets.secondaryColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: (CustomTextField(
                  controller: mobileController,
                  hintText: 'Mobile Number',
                  iconData: Icons.phone,
                  text: "Mobile")),
            ),
            const SizedBox(
              height: 30,
              width: double.infinity,
            ),
            Consumer<ForgotProvider>(builder: (_, provider, __) {
              return ElevatedButton(
                  onPressed: () {
                    provider.forgotScreen(context, mobileController.text);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPallets.primaryColor),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white),
                  ));
            })
          ]),
        ),
      ),
    );
  }
}
