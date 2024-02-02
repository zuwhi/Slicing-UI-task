import 'package:flutter/material.dart';
import 'package:slicing_ui/pages/DashboardPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentPage = DashboardPage();
  int currentTab = 1;
  Color custPurple = Color(0xFF5F33E1);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: currentPage,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFF5F33E1),
            tooltip: 'Increment',
            mini: true,
            onPressed: () {},
            shape: CircleBorder(),
            child: const Icon(Icons.add, color: Colors.white, size: 28),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
              height: 50,
              color: Color.fromARGB(172, 255, 255, 255),
              shape: const CircularNotchedRectangle(),
              notchMargin: 8,
              child: Container(
                // color: Colors.amber,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              color: currentTab == 1
                                  ? Color(0xFF5F33E1)
                                  : Colors.grey,
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
                              Icons.list_alt,
                              color: currentTab == 2
                                  ? Colors.deepPurple
                                  : Colors.grey,
                            ),
                          ),
                        ]),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              color: currentTab == 1
                                  ? Colors.deepPurple
                                  : Colors.grey,
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
                              color: currentTab == 2
                                  ? Colors.deepPurple
                                  : Colors.grey,
                            ),
                          ),
                        ]),
                  ],
                ),
              )),
        ));
  }
}
