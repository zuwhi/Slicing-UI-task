import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskGroups extends StatelessWidget {
  const TaskGroups({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Task Groups',
            style: GoogleFonts.lexendDeca(
                fontSize: 26, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
