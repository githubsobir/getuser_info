import 'package:flutter/material.dart';
import 'package:getuser_info/models/usermodel.dart';
import 'package:getuser_info/services/networks.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel myModel = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github user info"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          
          Text(
            "Login: ${myModel.login == null ? "" : myModel.login}",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Text("id:   ${myModel.id == null ? "" : myModel.id}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
          Text("type:  ${myModel.type == null ? "" : myModel.type}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
          Text(
              "created_at:  ${myModel.createdAt == null ? "" : myModel.createdAt}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
          Text(
              "updated_at:  ${myModel.updatedAt == null ? "float buttoni bosing" : myModel.updatedAt}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Networks.getData().then((value) => {
                  myModel = value,
                });
          });
        },
        child: Text(
          "Press Me",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
