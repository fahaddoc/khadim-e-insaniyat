import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:khadim_e_insaniyat/app_database/db/app_database.dart';
import 'package:khadim_e_insaniyat/app_database/migrations/migration_1_to_2.dart';
import 'package:path_provider/path_provider.dart';

import '../migrations/migration_2_to_3.dart';

late final AppDatabase database;
Future<void> initializeDatabase() async {
  if (kIsWeb) {
    print('Web platform detected. path_provider is not supported on web.');
    return;
  }

  final directory = await getApplicationDocumentsDirectory();
  final dbPath = '${directory.path}/app_database.db';

  // Check if the database file already exists.
  if (!await File(dbPath).exists()) {
    // Load the database from assets.
    final ByteData data =
        await rootBundle.load('assets/database/app_database.db');
    final List<int> bytes = data.buffer.asUint8List();

    // Create a file in the application's documents directory and write the database to it.
    await File(dbPath).writeAsBytes(bytes);
  }

  database = await $FloorAppDatabase
      .databaseBuilder(dbPath)
      .addMigrations([migration1to2, migration2to3]).build();
}
