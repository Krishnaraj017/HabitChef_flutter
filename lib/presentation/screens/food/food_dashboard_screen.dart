import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:habitchef/presentation/routes/app_router.dart';

@RoutePage()
class NutritionDashboardScreen extends StatelessWidget {
  const NutritionDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nutrition Dashboard',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          'January 8, 2025',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ],
                ),
              ),
            ),

            // Calorie Summary
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green[400]!, Colors.green[600]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Daily Calories',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '1,248 / 2,000 kcal',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      LinearProgressIndicator(
                        value: 0.62,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.white),
                        minHeight: 8,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildNutrientProgress(
                              'Proteins', '48g', 0.6, Colors.blue),
                          _buildNutrientProgress(
                              'Carbs', '156g', 0.7, Colors.orange),
                          _buildNutrientProgress(
                              'Fats', '42g', 0.4, Colors.red),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Meal Sections
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Today\'s Meals',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),

            // Meals List
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final meals = [
                    {
                      'name': 'Breakfast',
                      'time': '7:30 AM',
                      'calories': 420,
                      'items': ['Oatmeal', 'Banana', 'Almonds'],
                      'icon': Icons.brightness_6,
                      'color': Colors.orange,
                    },
                    {
                      'name': 'Lunch',
                      'time': '12:30 PM',
                      'calories': 580,
                      'items': ['Grilled Chicken', 'Brown Rice', 'Vegetables'],
                      'icon': Icons.wb_sunny,
                      'color': Colors.green,
                    },
                    {
                      'name': 'Snack',
                      'time': '3:30 PM',
                      'calories': 248,
                      'items': ['Greek Yogurt', 'Berries'],
                      'icon': Icons.coffee,
                      'color': Colors.purple,
                    },
                    {
                      'name': 'Dinner',
                      'time': '7:00 PM',
                      'calories': 0,
                      'items': ['Not logged yet'],
                      'icon': Icons.nights_stay,
                      'color': Colors.blue,
                    },
                  ];

                  if (index >= meals.length) return null;
                  final meal = meals[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: ExpansionTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: (meal['color'] as Color).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            meal['icon'] as IconData,
                            color: meal['color'] as Color,
                          ),
                        ),
                        title: Text(
                          meal['name'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${meal['time']} • ${meal['calories']} kcal',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Divider(),
                                const SizedBox(height: 8),
                                ...(meal['items'] as List<String>)
                                    .map((item) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Row(
                                            children: [
                                              Icon(Icons.fiber_manual_record,
                                                  size: 8,
                                                  color: Colors.grey[400]),
                                              const SizedBox(width: 8),
                                              Text(item),
                                            ],
                                          ),
                                        ))
                                    ,
                                const SizedBox(height: 8),
                                if (meal['name'] != 'Dinner') const Divider(),
                                if (meal['name'] != 'Dinner')
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text('Edit Meal'),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(const AddFoodRoute());
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildNutrientProgress(
      String label, String value, double progress, Color color) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(
                value: progress,
                backgroundColor: Colors.white.withOpacity(0.3),
                valueColor: AlwaysStoppedAnimation<Color>(color),
                strokeWidth: 8,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
