import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharepre_parent_child/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var userNameController = TextEditingController();
  var mobileNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime.shade900,
        title: Text('Shared Preference Parent to Child'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: userNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  labelText: 'User Name',
                  hintText: 'Enter the Name',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: mobileNoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  labelText: 'Mobile Number',
                  hintText: 'Enter the MobileNo',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                _save();
              },
              child: Text('Send Data'),
            ),
          ],
        ),
      ),
    );
  }

  _save() async {
    print('------------>${userNameController.text}');
    print('------------>${mobileNoController.text}');

    FocusScope.of(context).unfocus();
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('username', userNameController.text);
    await preferences.setString('mobileNo', mobileNoController.text);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SecondScreen()));
  }
}
