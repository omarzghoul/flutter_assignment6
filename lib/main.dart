import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool val = false;

  String countTime = "25:00";

  Map colors = {
    "primary": Color(0xffF87373),
    "appbar": Color(0xffF24646),
    "Container_countdown": Color(0xffFBA2A2),
    "button_start": Color(0xffCC5C5C),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors["primary"],
        drawer: Drawer(backgroundColor: Color(0xff3DA3C9)),
        appBar: AppBar(
          title: Center(
              child: Text(
            "Pomodoro",
          )),
          backgroundColor: colors["appbar"],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(16),
                width: double.infinity,
                color: colors["Container_countdown"],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                colors["primary"] = Color(0xffF87373);
                                colors["appbar"] = Color(0xffF24646);
                                colors["Container_countdown"] =
                                    Color(0xffFBA2A2);
                                colors["button_start"] = Color(0xffCC5C5C);
                                countTime = "25:00";
                              });
                            },
                            child: Text("Pomodoro",
                                style: TextStyle(color: Colors.white)),
                            style: TextButton.styleFrom(
                                backgroundColor: colors["primary"])),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                colors["primary"] = Color(0xff108992);
                                colors["appbar"] = Color(0xff0E7D85);
                                colors["Container_countdown"] =
                                    Color(0xff20C0C5);
                                colors["button_start"] = Color(0xff0D6E75);
                                countTime = "5:00";
                              });
                            },
                            child: Text("Short Break",
                                style: TextStyle(color: Colors.white)),
                            style: TextButton.styleFrom(
                                backgroundColor: colors["primary"])),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                colors["primary"] = Color(0xff6780FF);
                                colors["appbar"] = Color(0xff526FFE);
                                colors["Container_countdown"] =
                                    Color(0xffA994FB);
                                colors["button_start"] = Color(0xff4362FC);
                                countTime = "15:00";
                              });
                            },
                            child: Text(
                              "Long Break",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: colors["primary"]))
                      ],
                    ),
                    Text(
                      "$countTime",
                      style: TextStyle(fontSize: 80, color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("START"),
                      style: ElevatedButton.styleFrom(
                        primary: colors["button_start"],
                        minimumSize: Size(100, 45),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tasks",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Divider(
              height: 5,
              color: Colors.white,
            ),
            Expanded(
                child: ListView(
              children: [
                customCheckBox("task1", "description"),
              ],
            )),
            Container(
              margin: EdgeInsets.all(4),
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_box,
                      color: Color(0xffF87373),
                    ),
                    Text(
                      "Add Task",
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffF9BBBB),
                  minimumSize: Size(double.infinity, 45),
                ),
              ),
            )
          ],
        ));
  }

  Widget customCheckBox(String task, String description) {
    return CheckboxListTile(
      isThreeLine: true,
      subtitle: Text("$description"),
      value: val,
      onChanged: (value) {
        setState(() {
          val = value!;
        });
      },
      title: Text(
        "$task",
        style: TextStyle(
            decoration: val == true ? TextDecoration.lineThrough : null),
      ),
      activeColor: colors["appbar"],
    );
  }
}
