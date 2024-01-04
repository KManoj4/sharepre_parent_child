import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var userName = '';
  var mobileNo = '';

  @override
  void initState() {
    getAllData();
    super.initState();
  }
  getAllData() async{
    print('--------->${userName}');
    print('---------->${mobileNo}');

    final preferences = await SharedPreferences.getInstance();
    userName = preferences.getString('username')??'';
    mobileNo = preferences.getString('mobileNo')??'';
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime.shade900,
        title: Text('Shared Preference Parent to Child'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userName,style: TextStyle(fontSize: 20)),
            Text(mobileNo,style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
