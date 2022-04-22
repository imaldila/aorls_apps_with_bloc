import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../models/person.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    Key? key,
    required this.person,
  }) : super(key: key);

  final Person? person;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding * 2),
      child: Container(
        padding: const EdgeInsets.all(kPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kPadding),
            color: Colors.lightBlueAccent),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 50,
                  child: Text(
                    'ID',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 220,
                  child: Text(': ${person?.id ?? '-'}'),
                )
              ],
            ),
            const SizedBox(
              height: kPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 50,
                  child: Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 220,
                  child: Text(': ${person?.name ?? '-'}'),
                )
              ],
            ),
            const SizedBox(
              height: kPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 50,
                  child: Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 220,
                  child: Text(': ${person?.email ?? '-'}'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}