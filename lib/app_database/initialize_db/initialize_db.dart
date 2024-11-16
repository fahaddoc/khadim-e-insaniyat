import 'package:khadim_e_insaniyat/app_database/db/app_database.dart';

late final AppDatabase database;
Future<void> initializeDatabase() async{
  database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
}