import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListTask extends StatefulWidget {
  final dynamic
      snapshot; // Ganti dynamic sesuai dengan tipe data yang sesuai dengan kebutuhan

  const ListTask({Key? key, this.snapshot}) : super(key: key);

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.snapshot.data!.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 13),
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0.2),
                          blurRadius: 3,
                          color: Colors.grey.withOpacity(0.3),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.snapshot.data![index].title,
                              style: GoogleFonts.poppins(
                                fontSize: 13.0,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w500,
                              )),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(widget.snapshot.data![index].desc,
                              style: GoogleFonts.poppins(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              )),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.timer,
                                color: Color(0xFF5F33E1).withOpacity(0.5),
                                size: 20,
                              ),
                              const SizedBox(
                                width: 6.0,
                              ),
                              Text(widget.snapshot.data![index].limit,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.0,
                                    color: Color(0xFF5F33E1).withOpacity(0.5),
                                    fontWeight: FontWeight.w500,
                                  ))
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.orange.withOpacity(0.2)),
                            child: Icon(
                              Icons.work,
                              color: Colors.orange,
                              size: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 28.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xFF5F33E1).withOpacity(0.2)),
                            child: Text('To-do',
                                style: GoogleFonts.poppins(
                                  fontSize: 8.0,
                                  color: Color(0xFF5F33E1),
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
