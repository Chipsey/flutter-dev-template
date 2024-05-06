import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  final myController = new TextEditingController();

  String greetingMessage = "";

  void greetUser() {
    setState(() {
      greetingMessage = "Hello, " + myController.text;
    });
    myController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          "ToDo",
          style: TextStyle(color: Colors.grey[100]),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Column(
              children: [
                Text(greetingMessage),
                TextField(
                  controller: myController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Input Name.."),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: greetUser, child: Text("Submit"))
              ],
            ),
          )),
        ],
      ),
    );
  }
}
