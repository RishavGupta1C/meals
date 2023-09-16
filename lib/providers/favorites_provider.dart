import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

// We are not allowed to modify the list, rather we always need to create a new object
  void toggleMealFavoriteStatus(Meal meal) {
    // Available due to StateNotifier class
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state.where((m) => m.id != meal.id).toList();
    } else {
      // ... is spread operator
      state = [...state, meal];
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
