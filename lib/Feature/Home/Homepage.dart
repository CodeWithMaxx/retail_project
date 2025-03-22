import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:retail_project/Core/DB/database.dart';
import 'package:retail_project/Core/Db/db_key.dart';
import 'package:retail_project/Core/Theme/color_pallets.dart';
import 'package:retail_project/Feature/Auth/Screen/Profile_screen.dart';
import 'package:retail_project/Feature/Auth/Screen/changepass_screen.dart';
import 'package:retail_project/Feature/Auth/Screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<String?> futureUserName;

  @override
  void initState() {
    super.initState();
    futureUserName = initName();
  }

  Future<String?> initName() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    return await storage.read(key: DBKeys.personNameKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallets.secondaryColor,
      appBar: AppBar(
        backgroundColor: ColorPallets.secondaryColor,
      ),
      drawer: Drawer(
        backgroundColor: ColorPallets.secondaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            FutureBuilder<String?>(
              future: futureUserName,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return DrawerHeader(
                    decoration: BoxDecoration(color: ColorPallets.primaryColor),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return DrawerHeader(
                    decoration: BoxDecoration(color: ColorPallets.primaryColor),
                    child: Center(child: Text("Error loading user name")),
                  );
                } else {
                  return _buildHeader(snapshot.data);
                }
              },
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Changepassword()));
              },
              leading: Icon(Icons.password),
              title: Text('Change Password'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              leading: Icon(Icons.person_2_outlined),
              title: Text('Profile'),
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("logout"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                logout(context);
                                Navigator.pop(context);
                              },
                              child: Text("OK"))
                        ],
                      );
                    });
              },
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorPallets.secondaryColor),
                child: Image.asset(
                  "asset/logo.png",
                  fit: BoxFit.fill,
                ),
              ),
            ]),
            SizedBox(
              height: 50,
            ),
            Text("Aadhar Industries Pvt Ltd",
                style: TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black54,
                        offset: Offset(15.0, 15.0),
                      )
                    ],
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: ColorPallets.primaryColor))
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String? userName) {
    return DrawerHeader(
      decoration: BoxDecoration(color: ColorPallets.primaryColor),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              userName ?? "Guest",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }

  _buildItem(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      minLeadingWidth: 5,
    );
  }
}

logout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.clear();
  await prefs.setBool('loggedIN', false).then((_) => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => LoginPage())));
}
