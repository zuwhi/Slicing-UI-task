import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:slicing_ui/data/datasource/data.dart';

class TaskGroups extends StatelessWidget {
  const TaskGroups({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Color> _colors = [
      Colors.orange.withOpacity(0.2),
      Colors.green.withOpacity(0.2),
      Colors.blue.withOpacity(0.2),
      Colors.red.withOpacity(0.2),
      Colors.indigo.withOpacity(0.2),
      Colors.purple.withOpacity(0.2),
      Colors.pink.withOpacity(0.2),
      Colors.orange.withOpacity(0.2),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Task Groups',
          style: GoogleFonts.lexendDeca(
              fontSize: 26, fontWeight: FontWeight.w500, height: 0.001),
        ),
        Container(
          // color: Colors.indigo,
          // padding: EdgeInsets.only(top: 0),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: dataCategori.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 0),
                child: InkWell(
                    child: ListCategory(
                        data: dataCategori[index], colorCat: _colors[index])),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ListCategory extends StatelessWidget {
  const ListCategory({super.key, data, required this.colorCat}) : data = data;

  final data;
  final Color colorCat;

  @override
  Widget build(BuildContext context) {
    String namaKategori = data['name'];
    int persen = data['persentase'];
    int jumlahTask = data['count'];

    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      // height: 80,
      width: 50,
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: colorCat,
          ),
          padding: EdgeInsets.all(13),
          child: Icon(
            Icons.work,
            color: colorCat.withOpacity(1),
          ),
        ),
        title: Text(
          namaKategori,
          style:
              GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          '$jumlahTask Task',
          style: GoogleFonts.poppins(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Colors.grey[500]),
        ),
        trailing: Container(
          child: new CircularPercentIndicator(
            radius: 25.0,
            lineWidth: 4.0,
            animation: true,
            percent: persen * 0.01,
            center: new Text(
              "$persen%",
              style: new TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                  color: Colors.grey[700]),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: colorCat.withOpacity(1),
            backgroundColor: colorCat,
          ),
        ),
        // isThreeLine: true,
      ),
    );
  }
}
