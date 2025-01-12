import 'package:flutter/material.dart';

class HabitVisualHelper {
  static IconData getIconForHabit(String habitTitle) {
    final lowercaseTitle = habitTitle.toLowerCase();

    // Health & Fitness
    if (lowercaseTitle.contains('exercise') ||
        lowercaseTitle.contains('workout') ||
        lowercaseTitle.contains('gym')) {
      return Icons.fitness_center;
    } else if (lowercaseTitle.contains('yoga')) {
      return Icons.self_improvement;
    } else if (lowercaseTitle.contains('run') ||
        lowercaseTitle.contains('jog')) {
      return Icons.directions_run;
    } else if (lowercaseTitle.contains('swim')) {
      return Icons.pool;
    } else if (lowercaseTitle.contains('bike') ||
        lowercaseTitle.contains('cycle')) {
      return Icons.directions_bike;
    } else if (lowercaseTitle.contains('walk')) {
      return Icons.directions_walk;
    } else if (lowercaseTitle.contains('stretch')) {
      return Icons.accessibility_new;
    } else if (lowercaseTitle.contains('weight')) {
      return Icons.monitor_weight;
    }

    // Nutrition & Diet
    else if (lowercaseTitle.contains('water') ||
        lowercaseTitle.contains('drink')) {
      return Icons.water_drop;
    } else if (lowercaseTitle.contains('eat') ||
        lowercaseTitle.contains('food') ||
        lowercaseTitle.contains('meal')) {
      return Icons.restaurant;
    } else if (lowercaseTitle.contains('vitamin') ||
        lowercaseTitle.contains('supplement')) {
      return Icons.medication;
    } else if (lowercaseTitle.contains('diet') ||
        lowercaseTitle.contains('calorie')) {
      return Icons.monitor_heart;
    } else if (lowercaseTitle.contains('breakfast')) {
      return Icons.free_breakfast;
    } else if (lowercaseTitle.contains('snack')) {
      return Icons.cookie;
    } else if (lowercaseTitle.contains('fruit') ||
        lowercaseTitle.contains('vegetable')) {
      return Icons.eco;
    }

    // Mental Health & Wellness
    else if (lowercaseTitle.contains('meditate') ||
        lowercaseTitle.contains('mindfulness')) {
      return Icons.self_improvement;
    } else if (lowercaseTitle.contains('breathe')) {
      return Icons.air;
    } else if (lowercaseTitle.contains('journal') ||
        lowercaseTitle.contains('diary')) {
      return Icons.book;
    } else if (lowercaseTitle.contains('therapy')) {
      return Icons.psychology;
    } else if (lowercaseTitle.contains('gratitude')) {
      return Icons.favorite;
    } else if (lowercaseTitle.contains('mood')) {
      return Icons.mood;
    }

    // Sleep & Rest
    else if (lowercaseTitle.contains('sleep') ||
        lowercaseTitle.contains('bed')) {
      return Icons.bedtime;
    } else if (lowercaseTitle.contains('nap')) {
      return Icons.nights_stay;
    } else if (lowercaseTitle.contains('rest')) {
      return Icons.weekend;
    }

    // Learning & Development
    else if (lowercaseTitle.contains('study') ||
        lowercaseTitle.contains('learn')) {
      return Icons.school;
    } else if (lowercaseTitle.contains('read')) {
      return Icons.menu_book;
    } else if (lowercaseTitle.contains('write')) {
      return Icons.edit;
    } else if (lowercaseTitle.contains('code') ||
        lowercaseTitle.contains('program')) {
      return Icons.code;
    } else if (lowercaseTitle.contains('language')) {
      return Icons.language;
    } else if (lowercaseTitle.contains('practice')) {
      return Icons.repeat;
    } else if (lowercaseTitle.contains('homework')) {
      return Icons.assignment;
    }

    // Productivity & Work
    else if (lowercaseTitle.contains('work')) {
      return Icons.work;
    } else if (lowercaseTitle.contains('meeting')) {
      return Icons.groups;
    } else if (lowercaseTitle.contains('email')) {
      return Icons.email;
    } else if (lowercaseTitle.contains('plan') ||
        lowercaseTitle.contains('schedule')) {
      return Icons.event;
    } else if (lowercaseTitle.contains('deadline')) {
      return Icons.timer;
    } else if (lowercaseTitle.contains('project')) {
      return Icons.folder;
    }

    // Creativity & Hobbies
    else if (lowercaseTitle.contains('paint') ||
        lowercaseTitle.contains('draw')) {
      return Icons.brush;
    } else if (lowercaseTitle.contains('music') ||
        lowercaseTitle.contains('play')) {
      return Icons.music_note;
    } else if (lowercaseTitle.contains('photo')) {
      return Icons.photo_camera;
    } else if (lowercaseTitle.contains('garden')) {
      return Icons.yard;
    } else if (lowercaseTitle.contains('cook')) {
      return Icons.restaurant_menu;
    } else if (lowercaseTitle.contains('craft')) {
      return Icons.construction;
    }

    // Social & Relationships
    else if (lowercaseTitle.contains('call') ||
        lowercaseTitle.contains('phone')) {
      return Icons.phone;
    } else if (lowercaseTitle.contains('family')) {
      return Icons.family_restroom;
    } else if (lowercaseTitle.contains('friend')) {
      return Icons.people;
    } else if (lowercaseTitle.contains('date')) {
      return Icons.favorite_border;
    } else if (lowercaseTitle.contains('social')) {
      return Icons.public;
    }

    // Home & Organization
    else if (lowercaseTitle.contains('clean')) {
      return Icons.cleaning_services;
    } else if (lowercaseTitle.contains('laundry')) {
      return Icons.local_laundry_service;
    } else if (lowercaseTitle.contains('dishes')) {
      return Icons.wash;
    } else if (lowercaseTitle.contains('organize')) {
      return Icons.inventory_2;
    } else if (lowercaseTitle.contains('declutter')) {
      return Icons.delete_sweep;
    }

    // Finance & Money
    else if (lowercaseTitle.contains('budget') ||
        lowercaseTitle.contains('finance')) {
      return Icons.account_balance_wallet;
    } else if (lowercaseTitle.contains('save')) {
      return Icons.savings;
    } else if (lowercaseTitle.contains('invest')) {
      return Icons.trending_up;
    } else if (lowercaseTitle.contains('bill')) {
      return Icons.receipt_long;
    }

    // Personal Care
    else if (lowercaseTitle.contains('shower') ||
        lowercaseTitle.contains('bath')) {
      return Icons.shower;
    } else if (lowercaseTitle.contains('teeth') ||
        lowercaseTitle.contains('dental')) {
      return Icons.cleaning_services;
    } else if (lowercaseTitle.contains('skin')) {
      return Icons.face;
    } else if (lowercaseTitle.contains('hair')) {
      return Icons.content_cut;
    }

    // Travel & Exploration
    else if (lowercaseTitle.contains('travel')) {
      return Icons.flight;
    } else if (lowercaseTitle.contains('explore')) {
      return Icons.explore;
    } else if (lowercaseTitle.contains('adventure')) {
      return Icons.landscape;
    }

    // Spirituality & Religion
    else if (lowercaseTitle.contains('pray')) {
      return Icons.waves;
    } else if (lowercaseTitle.contains('worship')) {
      return Icons.church;
    } else if (lowercaseTitle.contains('spiritual')) {
      return Icons.spa;
    }

    // Default icon if no match is found
    return Icons.star;
  }

  static Color getColorForHabit(String habitTitle) {
    final lowercaseTitle = habitTitle.toLowerCase();

    // Health & Fitness
    if (lowercaseTitle.contains('exercise') ||
        lowercaseTitle.contains('workout') ||
        lowercaseTitle.contains('gym')) {
      return Colors.red[200]!;
    } else if (lowercaseTitle.contains('yoga')) {
      return Colors.deepPurple[200]!;
    } else if (lowercaseTitle.contains('run') ||
        lowercaseTitle.contains('jog')) {
      return Colors.orange[200]!;
    } else if (lowercaseTitle.contains('swim')) {
      return Colors.cyan[200]!;
    } else if (lowercaseTitle.contains('bike') ||
        lowercaseTitle.contains('cycle')) {
      return Colors.lightGreen[200]!;
    }

    // Nutrition & Diet
    else if (lowercaseTitle.contains('water') ||
        lowercaseTitle.contains('drink')) {
      return Colors.lightBlue[200]!;
    } else if (lowercaseTitle.contains('eat') ||
        lowercaseTitle.contains('food')) {
      return Colors.amber[200]!;
    } else if (lowercaseTitle.contains('vitamin')) {
      return Colors.yellow[200]!;
    }

    // Mental Health & Wellness
    else if (lowercaseTitle.contains('meditate') ||
        lowercaseTitle.contains('mindfulness')) {
      return Colors.purple[200]!;
    } else if (lowercaseTitle.contains('journal')) {
      return Colors.brown[200]!;
    } else if (lowercaseTitle.contains('therapy')) {
      return Colors.teal[200]!;
    }

    // Sleep & Rest
    else if (lowercaseTitle.contains('sleep') ||
        lowercaseTitle.contains('bed')) {
      return Colors.indigo[200]!;
    } else if (lowercaseTitle.contains('nap')) {
      return Colors.blue[100]!;
    }

    // Learning & Development
    else if (lowercaseTitle.contains('study') ||
        lowercaseTitle.contains('learn')) {
      return Colors.deepOrange[200]!;
    } else if (lowercaseTitle.contains('read')) {
      return Colors.blue[200]!;
    } else if (lowercaseTitle.contains('code')) {
      return Colors.grey[300]!;
    }

    // Productivity & Work
    else if (lowercaseTitle.contains('work')) {
      return Colors.blueGrey[200]!;
    } else if (lowercaseTitle.contains('email')) {
      return Colors.red[100]!;
    } else if (lowercaseTitle.contains('meeting')) {
      return Colors.purple[100]!;
    }

    // Creativity & Hobbies
    else if (lowercaseTitle.contains('paint') ||
        lowercaseTitle.contains('draw')) {
      return Colors.pink[200]!;
    } else if (lowercaseTitle.contains('music')) {
      return Colors.deepPurple[100]!;
    } else if (lowercaseTitle.contains('garden')) {
      return Colors.green[300]!;
    }

    // Social & Relationships
    else if (lowercaseTitle.contains('call') ||
        lowercaseTitle.contains('phone')) {
      return Colors.green[200]!;
    } else if (lowercaseTitle.contains('family')) {
      return Colors.pink[100]!;
    } else if (lowercaseTitle.contains('friend')) {
      return Colors.orange[100]!;
    }

    // Home & Organization
    else if (lowercaseTitle.contains('clean')) {
      return Colors.cyan[100]!;
    } else if (lowercaseTitle.contains('organize')) {
      return Colors.amber[100]!;
    }

    // Finance & Money
    else if (lowercaseTitle.contains('budget') ||
        lowercaseTitle.contains('finance')) {
      return Colors.green[100]!;
    } else if (lowercaseTitle.contains('save')) {
      return Colors.lightGreen[100]!;
    }

    // Personal Care
    else if (lowercaseTitle.contains('shower') ||
        lowercaseTitle.contains('bath')) {
      return Colors.lightBlue[100]!;
    } else if (lowercaseTitle.contains('skin')) {
      return Colors.pink[50]!;
    }

    // Travel & Exploration
    else if (lowercaseTitle.contains('travel')) {
      return Colors.amber[300]!;
    } else if (lowercaseTitle.contains('explore')) {
      return Colors.brown[100]!;
    }

    // Spirituality & Religion
    else if (lowercaseTitle.contains('pray') ||
        lowercaseTitle.contains('spiritual')) {
      return Colors.purple[50]!;
    } else {}

    // Default color if no match is found
    return const Color.fromARGB(255, 246, 172, 76);
  }
}
