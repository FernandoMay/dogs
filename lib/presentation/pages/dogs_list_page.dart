import 'package:dogs/presentation/bloc/dogs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogsListPage extends StatelessWidget {
  const DogsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dogs We Love'),
        centerTitle: true,
      ),
      body: BlocBuilder<DogsBloc, DogsState>(
        builder: (context, state) {
          if (state is DogsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DogsLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.dogs.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(state.dogs[index].dogName),subtitle: Text(state.dogs[index].description),leading: CircleAvatar(foregroundImage: NetworkImage(state.dogs[index].image),),);
              },
            );
          } else if (state is DogsError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}