import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HabitModel {
  final int? id;
  final String title;
  final DateTime time;
  final bool isDone;

  HabitModel({
    this.id,
    required this.title,
    required this.time,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'time': time.toIso8601String(),
      'isDone': isDone ? 1 : 0,
    };
  }

  factory HabitModel.fromMap(Map<String, dynamic> map) {
    return HabitModel(
      id: map['id'],
      title: map['title'],
      time: DateTime.parse(map['time']),
      isDone: map['isDone'] == 1,
    );
  }

  HabitModel copyWith({
    int? id,
    String? title,
    DateTime? time,
    bool? isDone,
  }) {
    return HabitModel(
      id: id ?? this.id,
      title: title ?? this.title,
      time: time ?? this.time,
      isDone: isDone ?? this.isDone,
    );
  }
}

class HabitDatabase {
  static final HabitDatabase instance = HabitDatabase._init();
  static Database? _database;

  HabitDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('habits.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE habits(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        time TEXT NOT NULL,
        isDone INTEGER NOT NULL
      )
    ''');
  }

  // Add new habit
  Future<int> addHabit(String title, DateTime time) async {
    final db = await instance.database;
    final habit = HabitModel(
      title: title,
      time: time,
    );

    return await db.insert('habits', habit.toMap());
  }

  // Get all habits
  Future<List<HabitModel>> getAddedHabits() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('habits');

    return List.generate(maps.length, (index) {
      return HabitModel.fromMap(maps[index]);
    });
  }

  // Toggle isDone status
  Future<int> toggleHabitStatus(int id) async {
    final db = await instance.database;

    // First get the current status
    final habit = await db.query(
      'habits',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (habit.isNotEmpty) {
      final currentStatus = habit.first['isDone'] == 1;
      return await db.update(
        'habits',
        {'isDone': currentStatus ? 0 : 1},
        where: 'id = ?',
        whereArgs: [id],
      );
    }
    return 0;
  }

  // Get completed habits
  Future<List<HabitModel>> getCompletedHabits() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'habits',
      where: 'isDone = ?',
      whereArgs: [1],
    );

    return List.generate(maps.length, (index) {
      return HabitModel.fromMap(maps[index]);
    });
  }

  // Get statistics for habits
  Future<Map<String, dynamic>> getHabitStatistics() async {
    final db = await instance.database;

    // Define start and end of the current day
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    // Get total habits for the current day
    final totalCount = Sqflite.firstIntValue(await db.rawQuery('''
      SELECT COUNT(*) FROM habits 
      WHERE time BETWEEN ? AND ?
    ''', [startOfDay.toIso8601String(), endOfDay.toIso8601String()])) ?? 0;

    // Get completed habits for the current day
    final completedCount = Sqflite.firstIntValue(await db.rawQuery('''
      SELECT COUNT(*) FROM habits 
      WHERE isDone = 1 
      AND time BETWEEN ? AND ?
    ''', [startOfDay.toIso8601String(), endOfDay.toIso8601String()])) ?? 0;

    // Calculate success rate for the current day
    final double successRate =
        totalCount > 0 ? (completedCount / totalCount) * 100 : 0.0;

    return {
      'totalHabitsToday': totalCount,
      'completedHabitsToday': completedCount,
      'successRateToday': successRate,
    };
  }

  // Calculate current streak of completed habits
  Future<int> _calculateCurrentStreak() async {
    final db = await instance.database;
    final today = DateTime.now();
    var currentDate = DateTime(today.year, today.month, today.day);
    var streak = 0;

    while (true) {
      final dayStart = currentDate;
      final dayEnd = currentDate.add(const Duration(days: 1));

      final hasCompletedHabits = Sqflite.firstIntValue(await db.rawQuery('''
          SELECT COUNT(*) FROM habits 
          WHERE isDone = 1 
          AND time BETWEEN ? AND ?
          ''', [dayStart.toIso8601String(), dayEnd.toIso8601String()])) ?? 0;

      final totalHabitsForDay = Sqflite.firstIntValue(await db.rawQuery('''
          SELECT COUNT(*) FROM habits 
          WHERE time BETWEEN ? AND ?
          ''', [dayStart.toIso8601String(), dayEnd.toIso8601String()])) ?? 0;

      // Break if no habits for this day or if habits exist but none completed
      if (totalHabitsForDay == 0 ||
          (totalHabitsForDay > 0 && hasCompletedHabits == 0)) {
        break;
      }

      streak++;
      currentDate = currentDate.subtract(const Duration(days: 1));
    }

    return streak;
  }

  // Get habits for specific date
  Future<List<HabitModel>> getHabitsByDate(DateTime date) async {
    final db = await instance.database;
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final List<Map<String, dynamic>> maps = await db.query(
      'habits',
      where: 'time BETWEEN ? AND ?',
      whereArgs: [startOfDay.toIso8601String(), endOfDay.toIso8601String()],
    );

    return List.generate(maps.length, (index) {
      return HabitModel.fromMap(maps[index]);
    });
  }

  // Get completion history for a specific habit
  Future<List<Map<String, dynamic>>> getHabitHistory(int habitId) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'habits',
      where: 'id = ?',
      whereArgs: [habitId],
      orderBy: 'time DESC',
    );

    return maps;
  }

  // Close database
  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }
}
