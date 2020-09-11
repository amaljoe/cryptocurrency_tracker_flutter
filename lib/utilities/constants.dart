import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kTitleTextStyle = GoogleFonts.bebasNeue(
  fontSize: 36,
  fontWeight: FontWeight.w300,
  color: Colors.white,
);

final kChatTextStyle = GoogleFonts.roboto(
  fontSize: 18,
  fontWeight: FontWeight.normal,
);

final kBoxShadow = [
  BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 6)
];

enum MessageType { me, you }
