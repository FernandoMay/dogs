import 'package:dogs/domain/models/dog.dart';
import 'package:dogs/presentation/pages/dog_detail.dart';
import 'package:dogs/utils.dart';
import 'package:flutter/cupertino.dart';

class DogCard extends StatelessWidget {
  final Dog dog;

  const DogCard({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return 
    GestureDetector(
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (_) => DogDetail(dog: dog),
        ),
      ),
      child: 
      Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 4.0,
          vertical: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: SizedBox(
                width: size.width * 0.36,
                height: size.height / 4,
                child: Image.network(
                  dog.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 240,
              decoration: const BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              padding: const EdgeInsets.only(
                bottom: 20.0,
                top: 20.0,
                left: 16.0,
                right: 8.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dog.dogName,
                    style: const TextStyle(
                        fontSize: 28.0,
                        color: color33,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    dog.description,
                    style: const TextStyle(
                        fontSize: 20.0,
                        color: color66,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  Text(
                    'Almost ${dog.age} years',
                    style: const TextStyle(
                        fontSize: 24.0,
                        color: color33,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
