import 'package:flutter/material.dart';
import 'package:slicing_ui/presentation/widgets/AvatarWidgets.dart';
import 'package:slicing_ui/presentation/widgets/InProgress.dart';
import 'package:slicing_ui/presentation/widgets/ProgressWidgets.dart';
import 'package:slicing_ui/presentation/widgets/TaskGroups.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              AvatarWigets(),
              const SizedBox(height: 20.0),
              ProgressWidget(),
              const SizedBox(height: 15.0),
              InProgress(),
              const SizedBox(height: 30.0),
              TaskGroups()
            ],
          ),
        ),
      ),
    );
  }
}
