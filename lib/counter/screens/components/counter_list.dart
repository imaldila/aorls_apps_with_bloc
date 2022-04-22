import 'package:flutter/material.dart';

import '../../../constants.dart';

class CounterList extends StatelessWidget {
  const CounterList({
    Key? key,
    required this.label,
    required this.value,
    this.onPressRemove,
    this.onPressAdd,
  }) : super(key: key);

  final String label, value;
  final Function()? onPressRemove, onPressAdd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: Row(
        children: [
          Text(label),
          const Spacer(),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: onPressRemove,
              icon: const Icon(Icons.remove),
            ),
          ),
          const SizedBox(
            width: kPadding / 2,
          ),
          Text(value),
          const SizedBox(
            width: kPadding / 2,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: onPressAdd,
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
