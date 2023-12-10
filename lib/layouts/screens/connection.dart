import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../providers/connection_bloc/connection_bloc.dart';

class ConnectionScreen extends StatelessWidget {
  const ConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ConnectionBloc, InternetState>(
        listener: (context, state) {
          if (state is NotConnectedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 1),
              ),
            );
          } else if (state is ConnectedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 1),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ConnectedState) {
            return _buildTextWidget(state.message);
          } else if (state is NotConnectedState) {
            return _buildTextWidget(state.message);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildTextWidget(String message) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}

class InternetCubit {}
