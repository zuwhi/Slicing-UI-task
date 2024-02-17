import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:slicing_ui/data/datasource/data.dart';

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
    final List<Color> _colors = [
      Colors.blue.withOpacity(0.5),
      Colors.red.withOpacity(0.5),
      Colors.orange.withOpacity(0.5),
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
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dataTask.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(right: 17),
                      child: InkWell(
                          child: BoxProgress(
                              colors: _colors,
                              index: index,
                              dataTask: dataTask[index])));
                },
              ))
        ],
      ),
    );
  }
}

// BoxProgress(colors: _colors, index: index)
class BoxProgress extends StatelessWidget {
  BoxProgress(
      {super.key, required List<Color> colors, required index, dataTask})
      : _colors = colors,
        index = index,
        dataTask = dataTask;

  final List<Color> _colors;
  final int index;
  final Map<String, dynamic> dataTask;

  @override
  Widget build(BuildContext context) {
    String task = dataTask['task'];
    String categori = dataTask['categori'];
    return Container(
        padding: EdgeInsets.all(18),
        // height: 150,
        width: 210,
        decoration: BoxDecoration(
          color: _colors[index],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categori,
                  style: GoogleFonts.poppins(
                      fontSize: 15,
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
            // const SizedBox(
            //   height: 14.0,
            // ),
            Text(
              task,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              // padding: EdgeInsets.symmetric(
              //   vertical: MediaQuery.of(context).size.height * 0.015,
              // ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: LinearPercentIndicator(
                    // width: 200,
                    animation: true,
                    lineHeight: 10.0,
                    animationDuration: 2500,
                    percent: 0.8,
                    barRadius: const Radius.circular(16),
                    progressColor: _colors[index].withOpacity(1),
                    backgroundColor: Colors.white.withOpacity(0.3),
                  )),
            )
          ],
        ));
  }
}
