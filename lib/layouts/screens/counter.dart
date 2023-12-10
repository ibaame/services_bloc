import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services_bloc/utils/app_localizations.dart';

import '../../providers/counter_bloc/counter_bloc.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(IncrementCounter());
            },
            icon: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          IconButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(ResetCounter());
            },
            icon: const Icon(Icons.exposure_zero),
          ),
          const SizedBox(height: 10),
          IconButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounter());
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'value'.tr(context),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterInitial) {
                  return const Text(
                    '0',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 30),
                  );
                } else if (state is CounterValue) {
                  return Text(
                    state.counter.toString(),
                    style:
                        const TextStyle(color: Colors.blueGrey, fontSize: 30),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
