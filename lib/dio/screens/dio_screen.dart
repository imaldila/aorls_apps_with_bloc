import 'package:aorl_apps_bloc/constants.dart';
import 'package:aorl_apps_bloc/dio/models/person.dart';
import 'package:flutter/material.dart';

import '../services/services.dart';
import 'components/person_card.dart';

class DioScreen extends StatefulWidget {
  const DioScreen({Key? key}) : super(key: key);

  @override
  State<DioScreen> createState() => _DioScreenState();
}

class _DioScreenState extends State<DioScreen> {
  Person? person;
  bool isLoading = false;

  Future getData() async {
    setState(() {
      isLoading = true;
    });

    Person? result = await Services.getById(3);

    if (result != null) {
      setState(() {
        person = result;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dio Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              child: const CircularProgressIndicator(),
              visible: isLoading,
            ),
            person != null
                ? PersonCard(
                    person: person!,
                  )
                : const Text('No Data'),
            const SizedBox(
              height: kPadding,
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () async {
                  getData();
                },
                child: const Text('GET'),
              ),
            ),
            const SizedBox(
              height: kPadding,
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () async {
                  Person? result = await Services.createUser(
                      'Aldila', 'Nurhadiputra', 'aldila@test.com');

                  if (result != null) {
                    setState(() {
                      person = result;
                    });
                  }
                },
                child: const Text('POST'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
