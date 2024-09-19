import 'package:flutter/material.dart';
import 'package:flutter_application_5/views/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.raleway().fontFamily,
        useMaterial3: false
      ),
      home: HomePage(),
    ),
  );
}
