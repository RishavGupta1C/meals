import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      // To get the border radius here we have to clip the part that is overflowing
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: Stack(children: [
          FadeInImage(
            // MemoryImage is a image provider class
            // Used to provide image from memory
            placeholder: MemoryImage(kTransparentImage),
            // NetworkImage is used to load image from internet
            image: NetworkImage(meal.imageUrl),
            // To cut-off and zoom-in the image if the image doesn't fit
            fit: BoxFit.cover,
            // To not get a cluster of image-rows
            height: 200,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black54,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
              child: Column(children: [
                Text(
                  meal.title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Row(children: [])
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
