import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

// ==================== AUTH TABLES ====================

/// Users table - stores user information
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uid => text().unique()();
  TextColumn get email => text()();
  TextColumn get username => text()();
  TextColumn get fullName => text()();
  TextColumn get phoneNumber => text().nullable()();
  TextColumn get profilePicture => text().nullable()();
  BoolColumn get isEmailVerified =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get isPhoneVerified =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

/// Auth tokens table - stores access and refresh tokens
class AuthTokens extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get accessToken => text()();
  TextColumn get refreshToken => text()();
  DateTimeColumn get expiresAt => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

// ==================== NOTES TABLES (Example CRUD Feature) ====================

/// Notes table - example CRUD feature
class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uid => text().unique()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get category => text().nullable()();
  TextColumn get priority => text().withDefault(const Constant('medium'))();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  TextColumn get userId => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  // Sync fields
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  TextColumn get syncAction =>
      text().nullable()(); // 'create', 'update', 'delete'
}

// ==================== DATABASE CLASS ====================

@DriftDatabase(tables: [Users, AuthTokens, Notes])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
      print('✅ Database tables created');
    },
    onUpgrade: (Migrator m, int from, int to) async {
      print('🔄 Migrating database from version $from to $to');
      // Add migrations here when schema changes
      // Example:
      // if (from < 2) {
      //   await m.addColumn(users, users.newColumn);
      // }
    },
    beforeOpen: (details) async {
      print('📂 Opening database...');
    },
  );

  // ==================== HELPER METHODS ====================

  /// Clear all data (useful for logout)
  Future<void> clearAllData() async {
    await transaction(() async {
      await delete(users).go();
      await delete(authTokens).go();
      await delete(notes).go();
    });
    print('🗑️ All database data cleared');
  }

  /// Clear specific table
  Future<void> clearTable(TableInfo table) async {
    await delete(table).go();
    print('🗑️ Table ${table.actualTableName} cleared');
  }

  /// Get database size
  Future<int> getDatabaseSize() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    if (await file.exists()) {
      return await file.length();
    }
    return 0;
  }

  /// Get database path
  Future<String> getDatabasePath() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    return p.join(dbFolder.path, 'app_database.sqlite');
  }
}

// ==================== DATABASE CONNECTION ====================

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));

    print('📁 Database path: ${file.path}');

    return NativeDatabase.createInBackground(file);
  });
}

// ==================== DATABASE SERVICE (Injectable Wrapper) ====================

@singleton
class DatabaseService {
  late final AppDatabase _database;

  DatabaseService() {
    _database = AppDatabase();
    print('✅ DatabaseService initialized');
  }

  AppDatabase get database => _database;

  Future<void> close() async {
    await _database.close();
    print('🔒 Database closed');
  }

  Future<void> clearAll() async {
    await _database.clearAllData();
  }
}
