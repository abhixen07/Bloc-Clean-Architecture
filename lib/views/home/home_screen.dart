import 'package:bloc_clean_coding/config/routes/routes_name.dart';
import 'package:bloc_clean_coding/services/storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen',style: GoogleFonts.montserrat(),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                LocalStorage localStorage = LocalStorage();
                //user session manage like clear prefs from local storage
                localStorage.clearValue('token').then((value){
                  localStorage.clearValue('isLogin').then((value){
                    Navigator.pushNamed(context, RoutesName.loginScreen);
                  });

                });
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Text('Home Screen',style: GoogleFonts.montserrat(fontSize: 20)),
        ),
      ),
    );
  }
}
