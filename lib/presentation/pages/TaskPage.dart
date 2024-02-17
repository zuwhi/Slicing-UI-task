import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_ui/data/model/TaskModel.dart';
import 'package:slicing_ui/data/datasource/database_instance.dart';
import 'package:slicing_ui/presentation/pages/DashboardPage.dart';
import 'package:slicing_ui/presentation/widgets/CategoryTask.dart';
import 'package:slicing_ui/presentation/widgets/DateTask.dart';
import 'package:slicing_ui/presentation/widgets/ListTask.dart';
import 'package:slicing_ui/presentation/widgets/TaskGroups.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key, this.currentpage}) : super(key: key);
  final currentpage;
  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  Future _refresh() async {
    setState(() {});
  }

  DatabaseInstance databaseInstance = DatabaseInstance();
  @override
  void initState() {
    databaseInstance.database();
    super.initState();
  }

  Widget build(BuildContext context) {
    var currentPage = widget.currentpage;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              setState(() {
                currentPage = DashboardPage();
              });
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Today's Task",
          style: GoogleFonts.lexendDeca(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.notification_important_outlined),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<List<TaskModel>>(
            future: databaseInstance.all(),
            builder: (context, snapshot) {
              // print(snapshot.hasData);
              if (snapshot.hasData || snapshot.data == 0) {
                if (snapshot.data!.isEmpty) {
                  return const Center(child: Text('data kosong'));
                }
                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        DateTask(),
                        const SizedBox(
                          height: 17.0,
                        ),
                        CategoryTask(),
                        const SizedBox(
                          height: 25.0,
                        ),
                        ListTask(snapshot: snapshot)
                      ],
                    ),
                  ),
                );

                // return ListView.builder(
                //   itemCount: snapshot.data!.length,
                //   itemBuilder: (context, index) {
                //     return ListTile(
                //       title: Text(snapshot.data![index].title ?? ''),
                //     );
                //   },
                // );
              } else {
                return Center(
                  child: CircularProgressIndicator(color: Colors.green),
                );
              }
            }),
      ),
    );
  }
}
