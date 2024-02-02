import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class InProgress extends StatefulWidget {
  const InProgress({
    super.key,
  });

  @override
  State<InProgress> createState() => _InProgressState();
}

class _InProgressState extends State<InProgress> {
  @override
  Widget build(BuildContext context) {
    final List<String> _category = [
      'All',
      'Living Room',
      'Bedroom',
      'Dining Room',
      'Kitchen',
    ];
    final List<Color> _colors = [
      Colors.blue.withOpacity(0.5),
      Colors.red.withOpacity(0.5),
      Colors.yellow.withOpacity(0.5),
      Colors.green.withOpacity(0.5),
      Colors.indigo.withOpacity(0.5),
      Colors.purple.withOpacity(0.5),
      Colors.pink.withOpacity(0.5),
      Colors.orange.withOpacity(0.5),
    ];

    int _selectedCategory = 0;

    void _onTapCategory(int index) {
      setState(() {
        _selectedCategory = index;
      });
    }

    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'In Progress',
              style: GoogleFonts.lexendDeca(
                  fontSize: 26, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          SizedBox(
              height: 135,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _category.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(right: 17),
                      child: InkWell(
                        child: BoxProgress(colors: _colors, index: index),
                      ));
                },
              ))
        ],
      ),
    );
  }
}

class BoxProgress extends StatelessWidget {
  BoxProgress({super.key, required List<Color> colors, required index})
      : _colors = colors,
        index = index;

  final List<Color> _colors;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        height: 180,
        width: 230,
        decoration: BoxDecoration(
          color: _colors[index],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Office Progress',
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey[200],
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.work,
                    color: _colors[index],
                    size: 16,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              'Pergi Ke sawah mencari belut',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 12.0,
            ),
            LinearPercentIndicator(
              width: double.infinity,
              animation: true,
              lineHeight: 11.0,
              animationDuration: 2500,
              percent: 0.8,
              barRadius: const Radius.circular(16),
              progressColor: _colors[index].withOpacity(1),
            ),
          ],
        ));
  }
}
