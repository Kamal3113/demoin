import '../../../common/image.dart';

class DietData {
  final String foodType;
  final String image;
  final String description;
  final List<MealType> mealType;

  DietData({
    required this.foodType,
    required this.image,
    required this.description,
    required this.mealType,
  });
}

List<DietData> dietData = [
  DietData(
    foodType: 'Breakfast',
    image: appBreakfast,
    description: 'Recommended 830-1120 Cal',
    mealType: [
      MealType(
        name: 'Avocado Toast',
        calories: '150',
        image: appAvacado,
      ),
      MealType(
        name: 'Tofu Scramble',
        calories: '200',
        image: appTofu,
      ),MealType(
        name: 'Yogurt with granola',
        calories: '80',
        image: appYogurt,
      ),MealType(
        name: 'Fruit',
        calories: '120',
        image: appFruit,
      ),MealType(
        name: 'Oats with dried fruit',
        calories: '180',
        image: appOat,
      ),
    ],
  ),
  DietData(
    foodType: 'Lunch',
    image: appLunch,
    description: 'Recommended 830-1120 Cal',
    mealType: [

      MealType(
        name: 'Cooked Grains',
        calories: '200',
        image: appGrains,
      ),
      MealType(
        name: 'Fruit',
        calories: '120',
        image: appFruit1,
      ),MealType(
        name: 'legumes',
        calories: '180',
        image: appLegumes,
      ),
    ],
  ),
  DietData(
    foodType: 'Snack',
    image: appSnack,
    description: 'Recommended 830-1120 Cal',
    mealType: [
      MealType(
        name: 'Greek Yogurt',
        calories: '80',
        image: appGreek,
      ), MealType(
        name: 'Milk',
        calories: '80',
        image: appMilk,
      ),
    ],
  ),
  DietData(
    foodType: 'Dinner',
    image: appDinner,
    description: 'Recommended 830-1120 Cal',
    mealType: [
      MealType(
        name: 'Avocado salsa',
        calories: '120',
        image: appSalsa,
      ),MealType(
        name: 'Watermelon salad',
        calories: '180',
        image: appWtr,
      ),
    ],
  ),
];

class MealType {
  final String name;
  final String calories;
  final String image;

  MealType({
    required this.name,
    required this.calories,
    required this.image,
  });
}
