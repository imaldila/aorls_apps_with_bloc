import 'package:aorl_apps_bloc/constants.dart';
import 'package:aorl_apps_bloc/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with BLoC'),
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Angka Saat ini adalah \n \n $state',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: kPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
