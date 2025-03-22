import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retail_project/Core/Theme/color_pallets.dart';
import 'package:retail_project/Core/Widget/textfield.dart';
import 'package:retail_project/Feature/Auth/Provider/profile_provider.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileProvider profileProvider = ProfileProvider();
  @override
  void initState() {
    super.initState();
    profileProvider.Profile(context);
    initController();
  }

  initController() {
    pNameController = profileProvider.userProfile.data!.personName;
    pAdController = profileProvider.userProfile.data!.address;
    cityController = profileProvider.userProfile.data!.city;
    contactNoController = profileProvider.userProfile.data!.contactNo;
    mobileController = profileProvider.userProfile.data!.mobileNo;
    emailController = profileProvider.userProfile.data!.email;
    aadharController = profileProvider.userProfile.data!.aadhar;
    panController = profileProvider.userProfile.data!.panNo;
    bankNMController = profileProvider.userProfile.data!.bankName;
    accountController = profileProvider.userProfile.data!.bankAcNo;
    branchController = profileProvider.userProfile.data!.bankBranch;
    ifcController = profileProvider.userProfile.data!.ifsc;
  }

  String? pNameController;
  String? pAdController;
  String? cityController;
  String? contactNoController;
  String? mobileController;
  String? emailController;
  String? aadharController;
  String? panController;
  String? bankNMController;
  String? branchController;
  String? accountController;
  String? ifcController;

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
                      "Profile",
                      style: GoogleFonts.poppins(
                          color: ColorPallets.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      // decoration: BoxDecoration(color: Colors.red.withOpacity(10)),
                      child: TextFormField(
                        initialValue: pNameController,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: "Person Name",
                            prefixIcon: Icon(Icons.person),
                            label: Text("Person Name"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      // decoration: BoxDecoration(color: Colors.red.withOpacity(10)),
                      child: TextFormField(
                        initialValue: pAdController,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: "Address",
                            prefixIcon: Icon(Icons.person),
                            label: Text("Address"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      // decoration: BoxDecoration(color: Colors.red.withOpacity(10)),
                      child: TextFormField(
                        initialValue: cityController,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: "CITY",
                            prefixIcon: Icon(Icons.person),
                            label: Text("City"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      // decoration: BoxDecoration(color: Colors.red.withOpacity(10)),
                      child: TextFormField(
                        initialValue: contactNoController,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: "Contact Number",
                            prefixIcon: Icon(Icons.person),
                            label: Text("Contact No"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      // decoration: BoxDecoration(color: Colors.red.withOpacity(10)),
                      child: TextFormField(
                        initialValue: mobileController,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: "Mobile Number",
                            prefixIcon: Icon(Icons.person),
                            label: Text("Mobile No"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      child: TextFormField(
                        initialValue: emailController,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: "Email Id",
                            prefixIcon: Icon(Icons.mail),
                            label: Text("Email ID"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      child: TextFormField(
                        initialValue: aadharController,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: "Aadhar Number",
                            prefixIcon: Icon(Icons.install_desktop),
                            label: Text("Aadhar No"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      child: TextFormField(
                        initialValue: pNameController,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: "Pan Number",
                            prefixIcon: Icon(Icons.password),
                            label: Text("Pan No"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      child: TextFormField(
                        initialValue: bankNMController,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: "Bank Name",
                            prefixIcon: Icon(Icons.comment_bank_rounded),
                            label: Text("Bank Name"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      child: TextFormField(
                        initialValue: branchController,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: "Branch Name",
                            prefixIcon: Icon(Icons.account_balance),
                            label: Text("Bank Branch Name"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      child: TextFormField(
                        initialValue: accountController,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: "Bank Account Number",
                            prefixIcon: Icon(Icons.account_balance_wallet),
                            label: Text("Bank Name"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      child: TextFormField(
                        initialValue: ifcController,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: "Bank IFSC CODE",
                            prefixIcon: Icon(Icons.comment_bank_rounded),
                            label: Text("IFSC CODE"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorPallets.primaryColor),
                          child: Text("Modified",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white)),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ));
  }
}
