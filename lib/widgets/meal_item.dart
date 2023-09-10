import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    Key? key,
    required this.meal,
    required this.onSelectMeal,
  }) : super(key: key);

  final Meal meal;
  final void Function() onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

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
        onTap: onSelectMeal,
        splashColor: Theme.of(context).primaryColor,
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
                // As this row is not unconstrained(due to Positioned left and right is zero),
                // So we are able to use a row within another row present in MealItemTrait
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  MealItemTrait(
                    icon: Icons.schedule,
                    label: '${meal.duration} min',
                  ),
                  const SizedBox(width: 12),
                  // const Spacer(),
                  MealItemTrait(
                    icon: Icons.work,
                    label: complexityText,
                  ),
                  const SizedBox(width: 12),
                  // const Spacer(),
                  MealItemTrait(
                    icon: Icons.attach_money,
                    label: affordabilityText,
                  ),
                ])
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
