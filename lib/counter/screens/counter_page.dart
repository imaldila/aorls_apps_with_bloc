import 'package:aorl_apps_bloc/constants.dart';
import 'package:aorl_apps_bloc/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/counter_list.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with BLoC'),
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Angka Saat ini adalah \n \n ${state.countA}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: kPadding,
              ),
              CounterList(
                label: 'Value A',
                value: '${state.countA}',
                onPressRemove: () => counterCubit.decrement(),
                onPressAdd: () => counterCubit.increment(),
              ),
              CounterList(
                label: 'Value B',
                value: '${state.countB}',
                onPressRemove: () => counterCubit.decrementB(),
                onPressAdd: () => counterCubit.incrementB(),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     CircleAvatar(
              //       child: IconButton(
              //         onPressed: () {
              //           context.read<CounterCubit>().decrement();
              //         },
              //         icon: const Icon(Icons.remove),
              //       ),
              //     ),
              //     CircleAvatar(
              //       child: IconButton(
              //         onPressed: () {
              //           context.read<CounterCubit>().increment();
              //         },
              //         icon: const Icon(Icons.add),
              //       ),
              //     ),
              //   ],
              // )
            ],
          );
        },
      ),
    );
  }
}
