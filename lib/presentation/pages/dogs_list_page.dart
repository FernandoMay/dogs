import 'package:dogs/presentation/bloc/dogs_bloc.dart';
import 'package:dogs/presentation/widgets/dog_card.dart';
import 'package:dogs/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogsListPage extends StatelessWidget {
  const DogsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Dogs We Love',
          style: TextStyle(
              fontSize: 30.0, color: color33, fontWeight: FontWeight.w500),
        ),
      ),
      child: BlocBuilder<DogsBloc, DogsState>(
        builder: (context, state) {
          if (state is DogsLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is DogsLoaded) {
            return SafeArea(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.dogs.length,
                itemBuilder: (context, index) {
                  return DogCard(dog: state.dogs[index]);
                },
              ),
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
