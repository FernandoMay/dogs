import 'package:dogs/domain/models/dog.dart';
import 'package:dogs/utils.dart';
import 'package:flutter/cupertino.dart';

class DogDetail extends StatelessWidget {
  final Dog dog;

  const DogDetail({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            leading: CupertinoNavigationBarBackButton(color: color66,
                onPressed: () => Navigator.pop(context)),
            largeTitle: Text(
              dog.dogName,
              style: const TextStyle(
                  fontSize: 28.0, color: color33, fontWeight: FontWeight.w700),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 800,
              child: Image.network(
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
                        'Almost ${dog.age} years',
                        style: const TextStyle(
                            fontSize: 24.0,
                            color: color33,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        dog.description,
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: color66,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 16),
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
