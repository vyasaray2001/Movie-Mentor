import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class modified_text extends StatelessWidget {
  final text;
  final color;
  final size;

  const modified_text({super.key, required this.text, this.color, this.size});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.breeSerif(color: color, fontSize: size),
    );
  }
}
