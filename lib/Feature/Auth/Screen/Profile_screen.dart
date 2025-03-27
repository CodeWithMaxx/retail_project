import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retail_project/Core/Theme/color_pallets.dart';
import 'package:retail_project/Core/Widget/textfield.dart';
import 'package:retail_project/Feature/Auth/Provider/profile_provider.dart';
import 'package:retail_project/Feature/bloc/profile_bloc.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileProvider profileProvider = ProfileProvider();
  late ProfileBloc _profileBloc;
  @override
  void initState() {
    super.initState();
    _profileBloc = ProfileBloc();
    _profileBloc.add(ProfileDetailsFetchEvent());
    profileProvider.Profile(context);
  }

  // initController() {
  //   pNameController = profileProvider.userProfile.data!.personName;
  //   pAdController = profileProvider.userProfile.data!.address;
  //   cityController = profileProvider.userProfile.data!.city;
  //   contactNoController = profileProvider.userProfile.data!.contactNo;
  //   mobileController = profileProvider.userProfile.data!.mobileNo;
  //   emailController = profileProvider.userProfile.data!.email;
  //   aadharController = profileProvider.userProfile.data!.aadhar;
  //   panController = profileProvider.userProfile.data!.panNo;
  //   bankNMController = profileProvider.userProfile.data!.bankName;
  //   accountController = profileProvider.userProfile.data!.bankAcNo;
  //   branchController = profileProvider.userProfile.data!.bankBranch;
  //   ifcController = profileProvider.userProfile.data!.ifsc;
  // }
  // pass this name in api for editing details

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
        body: BlocBuilder(
            bloc: _profileBloc,
            builder: (context, state) {
              switch (state.runtimeType) {
                case ProfileLoadingState:
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                case ProfileLoadedSuccessState:
                  final successState = state as ProfileLoadedSuccessState;
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
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
                                  initialValue:
                                      successState.userProfile.data?.personName,
                                  obscureText: false,
                                  onChanged: (value) {
                                    pNameController = value;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Person Name",
                                      prefixIcon: Icon(Icons.person),
                                      label: Text("Person Name"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
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
                                  initialValue:
                                      successState.userProfile.data?.address,
                                  obscureText: false,
                                  onChanged: (value) {
                                    pAdController = value;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Address",
                                      prefixIcon: Icon(Icons.person),
                                      label: Text("Address"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
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
                                  initialValue:
                                      successState.userProfile.data?.city,
                                  obscureText: false,
                                  onChanged: (value) {
                                    cityController = value;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "CITY",
                                      prefixIcon: Icon(Icons.person),
                                      label: Text("City"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
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
                                  initialValue:
                                      successState.userProfile.data?.contactNo,
                                  onChanged: (value) {
                                    contactNoController = value;
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      hintText: "Contact Number",
                                      prefixIcon: Icon(Icons.person),
                                      label: Text("Contact No"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
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
                                  initialValue:
                                      successState.userProfile.data?.mobileNo,
                                  onChanged: (value) {
                                    mobileController = value;
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      hintText: "Mobile Number",
                                      prefixIcon: Icon(Icons.person),
                                      label: Text("Mobile No"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                width: 350,
                                child: TextFormField(
                                  initialValue:
                                      successState.userProfile.data?.email,
                                  onChanged: (value) {
                                    emailController = value;
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      hintText: "Email Id",
                                      prefixIcon: Icon(Icons.mail),
                                      label: Text("Email ID"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                width: 350,
                                child: TextFormField(
                                  initialValue:
                                      successState.userProfile.data?.aadhar,
                                  onChanged: (value) {
                                    aadharController = value;
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      hintText: "Aadhar Number",
                                      prefixIcon: Icon(Icons.install_desktop),
                                      label: Text("Aadhar No"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                width: 350,
                                child: TextFormField(
                                  initialValue:
                                      successState.userProfile.data?.panNo,
                                  onChanged: (value) {
                                    panController = value;
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      hintText: "Pan Number",
                                      prefixIcon: Icon(Icons.password),
                                      label: Text("Pan No"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                width: 350,
                                child: TextFormField(
                                  initialValue:
                                      successState.userProfile.data?.bankName,
                                  onChanged: (value) {
                                    bankNMController = value;
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      hintText: "Bank Name",
                                      prefixIcon:
                                          Icon(Icons.comment_bank_rounded),
                                      label: Text("Bank Name"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
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
                                  initialValue:
                                      successState.userProfile.data?.bankBranch,
                                  onChanged: (value) {
                                    branchController = value;
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      hintText: "Branch Name",
                                      prefixIcon: Icon(Icons.account_balance),
                                      label: Text("Bank Branch Name"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                width: 350,
                                child: TextFormField(
                                  initialValue:
                                      successState.userProfile.data?.bankAcNo,
                                  onChanged: (value) {
                                    accountController = value;
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      hintText: "Bank Account Number",
                                      prefixIcon:
                                          Icon(Icons.account_balance_wallet),
                                      label: Text("Bank Name"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                width: 350,
                                child: TextFormField(
                                  initialValue:
                                      successState.userProfile.data?.ifsc,
                                  onChanged: (value) {
                                    ifcController = value;
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      hintText: "Bank IFSC CODE",
                                      prefixIcon:
                                          Icon(Icons.comment_bank_rounded),
                                      label: Text("IFSC CODE"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            ColorPallets.primaryColor),
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
                  );
                case ProfileErrorState:
                  return const Center(
                    child: Text('Ops! Something went wrong'),
                  );

                default:
                  return const Center(
                    child: Text('State Not Found'),
                  );
              }
            }));
  }
}
