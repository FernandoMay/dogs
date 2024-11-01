import 'package:dogs/domain/models/dog.dart';
import 'package:dogs/utils.dart';
import 'package:flutter/material.dart';

class DogDetail extends StatelessWidget {
  final Dog dog;

  const DogDetail({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 590,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                dog.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dog.dogName,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: color33, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        dog.description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: color66, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Almost ${dog.age} years',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: color33, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
