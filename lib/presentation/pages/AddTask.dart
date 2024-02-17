// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_ui/data/datasource/database_instance.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DatabaseInstance databaseInstance = DatabaseInstance();
  TextEditingController titleContoller = TextEditingController();
  TextEditingController descContoller = TextEditingController();
  TextEditingController limitContoller = TextEditingController();
  TextEditingController categoryContoller = TextEditingController();
  @override
  void initState()  {
     databaseInstance.database();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Taks",
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('title'),
              TextField(
                controller: titleContoller,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text('desc'),
              TextField(
                controller: descContoller,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text('limit'),
              TextField(
                controller: limitContoller,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text('category'),
              TextField(
                controller: categoryContoller,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await databaseInstance.insert({
                      'title': titleContoller.text,
                      'desc': descContoller.text,
                      'limit': limitContoller.text,
                      'category': categoryContoller.text,
                      'created_at': DateTime.now().toString(),
                      'update_at': DateTime.now().toString(),
                    });
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: Text('tambah data'))
            ],
          ),
        ),
      ),
    );
  }
}
