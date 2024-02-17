import 'dart:io';

import 'package:flutter/material.dart';
import 'package:slicing_ui/data/model/TaskModel.dart';
import 'package:slicing_ui/data/datasource/database_instance.dart';
import 'package:slicing_ui/presentation/pages/AddTask.dart';
import 'package:slicing_ui/presentation/pages/DashboardPage.dart';
import 'package:slicing_ui/presentation/pages/TaskPage.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // DatabaseInstance databaseInstance = DatabaseInstance();
  Widget currentPage = DashboardPage();
  int currentTab = 1;
  Color custPurple = Color(0xFF5F33E1);
  @override
  // void initState() {
  //   databaseInstance.database();
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF5F33E1),
        tooltip: 'Increment',
        mini: true,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTask()),
          );
        },
        shape: CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          height: 60,
          color: Color.fromARGB(172, 255, 255, 255),
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: Container(
            // color: Colors.amber,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  MaterialButton(
                    minWidth: 70,
                    elevation: 500,
                    onPressed: () {
                      setState(() {
                        currentPage = DashboardPage();
                        currentTab = 1;
                      });
                    },
                    child: Icon(
                      Icons.home_filled,
                      color: currentTab == 1 ? Color(0xFF5F33E1) : Colors.grey,
                    ),
                  ),
                  MaterialButton(
                    minWidth: 70,
                    elevation: 10,
                    onPressed: () {
                      setState(() {
                        currentPage = TaskPage(currentpage: currentPage);
                        currentTab = 2;
                      });
                    },
                    child: Icon(
                      Icons.calendar_month_rounded,
                      color: currentTab == 2 ? Colors.deepPurple : Colors.grey,
                    ),
                  ),
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  MaterialButton(
                    minWidth: 70,
                    elevation: 500,
                    onPressed: () {
                      setState(() {
                        currentPage = DashboardPage();
                        currentTab = 1;
                      });
                    },
                    child: Icon(
                      Icons.home_filled,
                      color: currentTab == 1 ? Colors.deepPurple : Colors.grey,
                    ),
                  ),
                  MaterialButton(
                    minWidth: 70,
                    elevation: 10,
                    onPressed: () {
                      setState(() {
                        currentPage = DashboardPage();
                        currentTab = 2;
                      });
                    },
                    child: Icon(
                      Icons.home_filled,
                      color: currentTab == 2 ? Colors.deepPurple : Colors.grey,
                    ),
                  ),
                ]),
              ],
            ),
          )),
    );
  }
}



     // body: FutureBuilder<List<TaskModel>>(
      //     future: databaseInstance.all(),
      //     builder: (context, snapshot) {
      //       print(snapshot.hasData);
      //       if (snapshot.hasData) {
      //         if (snapshot.data!.length == 0) {
      //           return const Center(child: Text('data kosong'));
      //         }
      //         return ListView.builder(
      //           itemCount: snapshot.data!.length,
      //           itemBuilder: (context, index) {
      //             return ListTile(
      //               title: Text(snapshot.data![index].title ?? ''),
      //             );
      //           },
      //         );
      //       } else {
      //         return Center(
      //           child: CircularProgressIndicator(color: Colors.green),
      //         );
      //       }
      //     }),
