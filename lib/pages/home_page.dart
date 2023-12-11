import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learning_flutterapi/models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> users = [];

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
              title: Text(user.email),
              subtitle: Text(user.nat),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchUser();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void fetchUser() async {
    log('fetchUser called');
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    dynamic transformed = results.map((e) {
      return UserModel(
        email: e['email'],
        cell: e['cell'],
        phone: e['phone'],
        nat: e['nat'],
        name: e['name'],
        gender: e['gender'],
      );
    }).toList();
    setState(() {
      users = transformed;
    });
    log('fetchUser completed');
  }
}
