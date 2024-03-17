import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/showcase_timeline_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'TimelineTile Showcase',
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.nanumPenScriptTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: Colors.white),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ShowcaseTimelineTile(),
    );
}
