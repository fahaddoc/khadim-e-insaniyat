import 'package:khadim_e_insaniyat/app_database/db/app_database.dart';
import 'package:khadim_e_insaniyat/app_database/migrations/migration_1_to_2.dart';

late final AppDatabase database;
Future<void> initializeDatabase() async{
  database = await $FloorAppDatabase.databaseBuilder('app_database.db').addMigrations([migration1to2]).build();
}