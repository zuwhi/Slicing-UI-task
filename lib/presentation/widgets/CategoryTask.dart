import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_ui/data/datasource/data.dart';

class CategoryTask extends StatefulWidget {
  const CategoryTask({
    super.key,
  });

  @override
  State<CategoryTask> createState() => _CategoryTaskState();
}

class _CategoryTaskState extends State<CategoryTask> {
  int _selected = 0;

  void _onSelect(index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () => _onSelect(index),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: _selected == index
                          ? Color(0xFF5F33E1)
                          : Color(0xFF5F33E1).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      dataCategori[index]['name'],
                      style: GoogleFonts.poppins(
                          fontSize: 15.0,
                          color: _selected == index
                              ? Colors.white
                              : Color(0xFF5F33E1),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
