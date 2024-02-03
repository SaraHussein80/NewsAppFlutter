import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/nav_bar_screens/nav_categories.dart';
import 'package:login/nav_bar_screens/nav_main.dart';
import 'package:login/nav_bar_screens/nav_setting.dart';
import 'package:login/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {

    const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  List<Widget> pages = [
    MainScreen(),
    CategoreScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 2,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.exit_to_app),
                  Text(
                    "LogOut",
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: onnavBarTap,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Setting"),
          ]),
    );
  }

  onnavBarTap(int index) {
    pageIndex = index;
    setState(() {});
  }
}




/* Text(
              'Email : ${this.widget.email}',
              style: GoogleFonts.robotoCondensed(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Password: ${this.widget.pass}',
              style: GoogleFonts.robotoCondensed(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),*/