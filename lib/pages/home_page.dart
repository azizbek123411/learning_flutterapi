import 'package:flutter/material.dart';
import 'package:learning_flutterapi/models/user_model.dart';
import 'package:learning_flutterapi/services/user_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    // fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Learning'),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Text(user.fullName),
              subtitle: Text(user.nat),
            );
          }),
    );
  }

  Future<void> fetchUser() async {
    final response = await UserAPI.fetchUser();
    setState(() {
      users = response;
    });
  }
}
