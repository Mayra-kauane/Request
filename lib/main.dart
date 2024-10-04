import 'package:flutter/material.dart';
import 'package:flutter_application_5/views/home_page.dart';
import 'package:flutter_application_5/views/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_5/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.raleway().fontFamily,
        useMaterial3: false
      ),
      home: LoginPage(),
    ),
  );
}
