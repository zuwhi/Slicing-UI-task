// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:slicing_ui/widgets/AvatarWidgets.dart';
import 'package:slicing_ui/widgets/InProgress.dart';
import 'package:slicing_ui/widgets/ProgressWidgets.dart';
import 'package:slicing_ui/widgets/TaskGroups.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.png"),
                fit: BoxFit.cover,
              ),
            )),
            const SizedBox(
              height: 20.0,
            ),
            AvatarWigets(),
            const SizedBox(
              height: 30.0,
            ),
            ProgressWidget(),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(child: InProgress()),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(child: TaskGroups())
          ],
        ),
      ),
    );
  }
}
