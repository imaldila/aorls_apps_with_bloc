import 'package:aorl_apps_bloc/list_api/models/user_model.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  String output = 'no data';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo List API'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              output,
            ),
            ElevatedButton(
              onPressed: () {
                User.getUsers('2').then(
                  (users) {
                    output = '';
                    for (int i = 0; i < users.length; i++) {
                      output = output + '[ ' + users[i].name + ' ]';
                      setState(() {});
                      print('$output');
                    }
                  },
                );
              },
              child: const Text('GET'),
            ),
          ],
        ),
      ),
    );
  }
}
