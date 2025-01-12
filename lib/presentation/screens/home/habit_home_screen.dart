import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitchef/data/models/habit.dart';
import 'package:habitchef/di/get_it.dart';
import 'package:habitchef/presentation/cubits/add_habit_cubit/add_habit_cubit.dart';
import 'package:habitchef/presentation/cubits/get_added_habits_cubit/get_added_habit_state.dart';
import 'package:habitchef/presentation/cubits/get_added_habits_cubit/get_added_habits_cubit.dart';
import 'package:habitchef/presentation/cubits/home/home_cubit.dart';
import 'package:habitchef/presentation/cubits/home/home_state.dart';
import 'package:habitchef/presentation/cubits/progress_cubit/progress_cubit.dart';
import 'package:habitchef/presentation/cubits/progress_cubit/progress_state.dart';
import 'package:habitchef/presentation/routes/app_router.dart';
import 'package:habitchef/utils/helper.dart';
import 'package:intl/intl.dart';

@RoutePage()
class HabitHomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const HabitHomeScreen({super.key});

  @override
  State<HabitHomeScreen> createState() => _HabitTrackerHomeState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => getIt<HomeCubit>()..getUser()),
      BlocProvider(create: (_) => HabitStatsCubit()..fetchTodayStats()),
      BlocProvider(create: (_) => getIt<AddHabitCubit>()),
      BlocProvider(
          create: (_) => getIt<GetAddedHabitsCubit>()..getAllAddedHabits()),
    ], child: this);
  }
}

class _HabitTrackerHomeState extends State<HabitHomeScreen> {
  bool _isRefreshing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
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
                        BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            if (state is UserLoaded) {
                              return Text(
                                // 'Hi, ${state.userName}!',
                                'Hi',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              );
                            }
                            return SizedBox.shrink();
                          },
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Let\'s make today count',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        "HabitChef",
                        style: TextStyle(color: Colors.blue, fontSize: 28),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Progress Overview
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue[400]!, Colors.blue[600]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Today\'s Progress',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<HabitStatsCubit, HabitStatsState>(
                        builder: (context, state) {
                          if (state is HabitStatsSuccess) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildProgressStat(
                                  '${state.completedHabitsToday}/${state.totalHabitsToday}',
                                  'Habits Completed',
                                ),
                                _buildProgressStat(
                                    state.successRateToday.toStringAsFixed(2),
                                    'Success Rate'),
                                _buildProgressStat('Level', 'Beginner'),
                              ],
                            );
                          }
                          return SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Habits List Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today\'s Habits',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isRefreshing = true;
                        });

                        // Trigger the Cubit methods
                        context.read<GetAddedHabitsCubit>().getAllAddedHabits();
                        context.read<HabitStatsCubit>().fetchTodayStats();

                        // Reset the animation after some delay
                        Future.delayed(Duration(seconds: 1), () {
                          setState(() {
                            _isRefreshing = false;
                          });
                        });
                      },
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 100),
                        child: CircleAvatar(
                          key: ValueKey<bool>(_isRefreshing),
                          radius: 24,
                          backgroundColor: Colors.blue[100],
                          child: IconButton(
                            onPressed:
                                null, // We handle the onPressed in GestureDetector
                            icon: _isRefreshing
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.blue),
                                  )
                                : Icon(
                                    Icons.refresh,
                                    color: Colors.blue,
                                  ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Habits List
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return BlocBuilder<GetAddedHabitsCubit, GetAddedHabitState>(
                    builder: (context, state) {
                      if (state is GetAddedHabitSuccess) {
                        if (state.habits.isEmpty) {
                          // Display empty icon or message
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 100.0),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.inbox_outlined,
                                    size: 80,
                                    color: Colors.grey[400],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'No Habits Added',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Start by adding your first habit!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        if (index >= state.habits.length) {
                          return SizedBox
                              .shrink(); // Handle out of bounds index
                        }

                        final habit = state.habits[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 8.0),
                          child: _HabitCard(habit: habit),
                        );
                      } else if (state is GetAddedHabitIsEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 100.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.inbox_outlined,
                                  size: 80,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'No Habits Added',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Start by adding your first habit!',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (state is GetAddedHabitError) {
                        return Center(child: Text(state.message));
                      }

                      return const Center(child: Text('No Habits to track'));
                    },
                  );
                },
                // Add childCount to avoid infinite scrolling
                childCount: context.select((GetAddedHabitsCubit cubit) =>
                    cubit.state is GetAddedHabitSuccess
                        ? (cubit.state as GetAddedHabitSuccess).habits.length
                        : 0),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          BlocBuilder<GetAddedHabitsCubit, GetAddedHabitState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              context.router.push(AddHabitRoute(
                  habitStatsCubit: context.read<HabitStatsCubit>(),
                  getAddedHabitsCubit: context.read<GetAddedHabitsCubit>()));
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }

  Widget _buildProgressStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _HabitCard extends StatefulWidget {
  HabitModel habit;

  _HabitCard({
    required this.habit,
  });

  @override
  State<_HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<_HabitCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: HabitVisualHelper.getColorForHabit(widget.habit.title),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            HabitVisualHelper.getIconForHabit(widget.habit.title),
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.habit.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          formatTime(widget.habit.time.toString()),
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        trailing: IconButton(
            icon: Icon(
              widget.habit.isDone ? Icons.check_circle : Icons.circle_outlined,
              color: widget.habit.isDone ? Colors.green : Colors.grey,
              size: 30,
            ),
            onPressed: () {
              print("clivkng");
              print(widget.habit.isDone);
              // Create a new HabitModel with updated isDone value
              final updatedHabit =
                  widget.habit.copyWith(isDone: !widget.habit.isDone);

              // Update the state with the new habit
              setState(() {
                widget.habit = updatedHabit;
              });
              context
                  .read<GetAddedHabitsCubit>()
                  .markHabitAsDone(id: widget.habit.id!);
            }),
      ),
    );
  }
}

String formatTime(String timestamp) {
  DateTime dateTime = DateTime.parse(timestamp);
  return DateFormat('hh:mm a').format(dateTime);
}
